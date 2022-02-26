import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/grpc/generated/message.pbgrpc.dart';
import 'package:flutter_realtime/core/grpc/grpc_client_helper.dart';
import 'package:flutter_realtime/core/helper/track_context.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:flutter_realtime/features/message/model/message_model.dart';
import 'package:flutter_realtime/features/message/model/message_room_model.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class MessageProvider extends ChangeNotifier {
  ClientChannel? _newMessageListenChannel;

  final List<MessageRoomModel> rooms = [];
  String? errorMessage;
  bool isLoading = false;

  MessageRoomModel? selectedRoom;
  final List<MessageModel> messages = [];
  bool isMessagesLoading = false;

  void init() {
    rooms.clear();
    errorMessage = null;
    getRooms();
    listenToNewMessage();
  }

  Future<void> exit() async {
    if (_newMessageListenChannel != null) {
      await _newMessageListenChannel!.terminate();
      _newMessageListenChannel = null;
    }
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
      String err = "Failed to connect";
      if (e is GrpcError) {
        err = e.message ?? "Failed to connect";
      }
      errorMessage = err;
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> listenToNewMessage() async {
    try {
      _newMessageListenChannel = GrpcClientHelper.getChannel();
      final stub = MessageServiceClient(_newMessageListenChannel!,
          options: await GrpcClientHelper.getAuthOptions());

      await for (ListenToNewMessageResponse res
          in stub.listenToNewMessage(ListenToNewMessageRequest())) {
        if (selectedRoom != null &&
            selectedRoom!.roomId == res.newMessage.roomId) {
          messages.insert(
            0,
            MessageModel.fromGRPC(
                userId: Provider.of<AppState>(TrackContext.getCurrentContext(),
                        listen: false)
                    .user!
                    .id,
                message: res.newMessage),
          );
          notifyListeners();
        }
      }
    } catch (e) {
      // String err = "Failed to connect";
      // if (e is GrpcError) {
      //   err = e.message ?? "Failed to connect";
      // }
      log(e.toString());
    }
  }

  void joinRoom({required MessageRoomModel messageRoom}) {
    selectedRoom = messageRoom;
    messages.clear();
    isMessagesLoading = false;
    getMessages();
  }

  void leftRoom() {
    selectedRoom = null;
    messages.clear();
  }

  Future<void> getMessages() async {
    try {
      final channel = GrpcClientHelper.getChannel();
      final stub = MessageServiceClient(channel,
          options: await GrpcClientHelper.getAuthOptions());

      final res = await stub
          .getMessages(GetMessagesRequest(roomId: selectedRoom!.roomId));

      for (Message element in res.messages) {
        messages.add(MessageModel.fromGRPC(
            userId: Provider.of<AppState>(TrackContext.getCurrentContext(),
                    listen: false)
                .user!
                .id,
            message: element));
      }
    } catch (e) {
      // String err = "Failed to connect";
      // if (e is GrpcError) {
      //   err = e.message ?? "Failed to connect";
      // }
      log(e.toString());
    }
    isMessagesLoading = false;
    notifyListeners();
  }

  Future<void> sendMessage(String message) async {
    try {
      final channel = GrpcClientHelper.getChannel();
      final stub = MessageServiceClient(channel,
          options: await GrpcClientHelper.getAuthOptions());

      await stub.sendMessage(
          SendMessageRequest(roomId: selectedRoom!.roomId, body: message));
    } catch (e) {
      // String err = "Failed to connect";
      // if (e is GrpcError) {
      //   err = e.message ?? "Failed to connect";
      // }
      log(e.toString());
    }
    notifyListeners();
  }
}
