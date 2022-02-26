import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/grpc/generated/message.pbgrpc.dart';
import 'package:flutter_realtime/core/grpc/grpc_client_helper.dart';
import 'package:flutter_realtime/features/message/model/message_room_model.dart';
import 'package:grpc/grpc.dart';

class MessageProvider extends ChangeNotifier {
  final List<MessageRoomModel> rooms = [];
  String? errorMessage;
  bool isLoading = false;

  void init() {
    rooms.clear();
    errorMessage = null;
    getRooms();
  }

  Future<void> getRooms() async {
    isLoading = true;

    try {
      final channel = GrpcClientHelper.getChannel();
      final stub = MessageServiceClient(channel,
          options: await GrpcClientHelper.getAuthOptions());

      final res = await stub.getMessageRooms(GetMessageRoomsRequest());

      for (MessageRoom element in res.rooms) {
        rooms.add(
          MessageRoomModel(
              roomId: element.id,
              roomName: element.roomName,
              isOneToOne: element.isOneToOne),
        );
      }
    } catch (e) {
      String err = "Failed to login";
      if (e is GrpcError) {
        err = e.message ?? "Failed to login";
      }
      errorMessage = err;
    }
    isLoading = false;
    notifyListeners();
  }
}
