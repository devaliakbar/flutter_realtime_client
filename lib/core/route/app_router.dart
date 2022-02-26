import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/sign_up.dart';
import 'package:flutter_realtime/features/message/model/message_room_model.dart';
import 'package:flutter_realtime/features/message/presentation/screens/message_home.dart';
import 'package:flutter_realtime/features/message/presentation/screens/message_screen.dart';
import 'package:flutter_realtime/features/welcome/presentation/screens/splash_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (settings.name == SplashScreen.routeName) {
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    }

    if (settings.name == SignUp.routeName) {
      return MaterialPageRoute(builder: (_) => const SignUp());
    }

    if (settings.name == Login.routeName) {
      return MaterialPageRoute(builder: (_) => const Login());
    }

    if (settings.name == MessageHome.routeName) {
      return MaterialPageRoute(builder: (_) => const MessageHome());
    }

    if (settings.name == MessageScreen.routeName) {
      return MaterialPageRoute(
        builder: (_) => MessageScreen(
          room: settings.arguments as MessageRoomModel,
        ),
      );
    }

    throw "Route not implemented";
  }
}
