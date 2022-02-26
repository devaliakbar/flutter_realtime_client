import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/message/model/message_room_model.dart';
import 'package:flutter_realtime/features/message/provider/message_provider.dart';
import 'package:provider/provider.dart';

class MessageScreen extends StatefulWidget {
  static const String routeName = '/message_screen';

  final MessageRoomModel room;

  const MessageScreen({required this.room, Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  late final MessageProvider messageProvider;

  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    messageProvider = Provider.of<MessageProvider>(context, listen: false);
    messageProvider.joinRoom(messageRoom: widget.room);
  }

  @override
  void dispose() {
    super.dispose();

    _messageController.dispose();
    messageProvider.leftRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.room.roomName),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Consumer<MessageProvider>(
                builder: (_, messageProvider, __) {
                  if (messageProvider.isMessagesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                    itemCount: messageProvider.messages.length,
                    reverse: true,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(messageProvider.messages[index].body),
                        subtitle: Text(
                          messageProvider.messages[index].isOwner
                              ? "You"
                              : messageProvider.messages[index].owner.fullName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        tileColor: messageProvider.messages[index].isOwner
                            ? Colors.green.withOpacity(0.1)
                            : null,
                      );
                    },
                  );
                },
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        labelText: "Type message",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        final body = _messageController.text.trim();

                        if (body.isNotEmpty) {
                          _messageController.text = "";
                          messageProvider.sendMessage(body);
                        }
                      },
                      icon: const Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
