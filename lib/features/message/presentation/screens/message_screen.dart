import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/message/model/message_room_model.dart';

class MessageScreen extends StatelessWidget {
  static const String routeName = '/message_screen';

  final MessageRoomModel room;

  const MessageScreen({required this.room, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(room.roomName),
      ),
      body: SafeArea(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
