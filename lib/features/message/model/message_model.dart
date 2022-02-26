import 'package:flutter_realtime/core/grpc/generated/message.pb.dart';
import 'package:flutter_realtime/features/auth/models/user.dart';

class MessageModel {
  final String messageId;
  final String roomId;
  final DateTime dateTime;
  final String body;
  final User owner;
  final bool isOwner;

  MessageModel(
      {required this.messageId,
      required this.roomId,
      required this.dateTime,
      required this.body,
      required this.owner,
      required this.isOwner});

  factory MessageModel.fromGRPC(
      {required String userId, required Message message}) {
    return MessageModel(
        messageId: message.id,
        roomId: message.roomId,
        dateTime:
            DateTime.fromMillisecondsSinceEpoch(message.time.toInt() * 1000),
        body: message.body,
        owner: User(
            id: message.sender.id,
            fullName: message.sender.fullName,
            email: message.sender.email),
        isOwner: message.sender.id == userId);
  }
}
