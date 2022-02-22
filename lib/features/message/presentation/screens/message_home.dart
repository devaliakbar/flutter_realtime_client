import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessageHome extends StatelessWidget {
  static const String myRoute = '/message_home';

  const MessageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
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
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
