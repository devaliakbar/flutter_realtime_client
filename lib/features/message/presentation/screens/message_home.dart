import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/message/presentation/widgets/message_home/message_home_appbar.dart';
import 'package:flutter_realtime/features/message/provider/message_provider.dart';
import 'package:provider/provider.dart';

class MessageHome extends StatefulWidget {
  static const String myRoute = '/message_home';

  const MessageHome({Key? key}) : super(key: key);

  @override
  State<MessageHome> createState() => _MessageHomeState();
}

class _MessageHomeState extends State<MessageHome> {
  @override
  void initState() {
    super.initState();

    Provider.of<MessageProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MessageHomeAppbar(),
      body: SafeArea(
        child: Consumer<MessageProvider>(
          builder: (__, MessageProvider messageProvider, _) {
            if (messageProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (messageProvider.errorMessage != null) {
              return Center(
                child: Text(
                  messageProvider.errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            if (messageProvider.rooms.isEmpty) {
              return const Center(
                child: Text("Start a new conversation"),
              );
            }

            return ListView.separated(
              itemCount: messageProvider.rooms.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(messageProvider.rooms[index].roomName),
                onTap: () {},
                leading: CircleAvatar(
                  child: Icon(messageProvider.rooms[index].isOneToOne
                      ? Icons.person
                      : Icons.groups),
                  backgroundColor: Colors.white,
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            );
          },
        ),
      ),
    );
  }
}
