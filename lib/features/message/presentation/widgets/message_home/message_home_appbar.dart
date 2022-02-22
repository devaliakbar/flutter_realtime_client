import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageHomeAppbar extends StatelessWidget with PreferredSizeWidget {
  MessageHomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Inbox"),
      actions: [
        IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.remove("user_info");
              const storage = FlutterSecureStorage();
              await storage.delete(key: "jwt");

              Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.myRoute, (Route<dynamic> route) => false);
            },
            icon: const Icon(Icons.power))
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
