import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/auth/models/user.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:flutter_realtime/features/message/presentation/screens/message_home.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Flutter gRPC, WebRTC demo",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  Future<void> _checkToken() async {
    await Future.delayed(const Duration(seconds: 2));

    String route = Login.routeName;

    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userInfo = prefs.getString('user_info');

      if (userInfo != null) {
        const storage = FlutterSecureStorage();
        final String? jwt = await storage.read(key: "jwt");

        if (jwt != null) {
          final AppState appState =
              Provider.of<AppState>(context, listen: false);
          appState.setUser(User.fromJson(jsonDecode(userInfo)));
          appState.setJwtToken(jwt);

          route = MessageHome.routeName;
        }
      }
    } catch (_) {}

    Navigator.of(context)
        .pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
  }
}
