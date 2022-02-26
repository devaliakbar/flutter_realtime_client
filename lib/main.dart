import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/helper/track_context.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/sign_up.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:flutter_realtime/features/message/presentation/screens/message_home.dart';
import 'package:flutter_realtime/features/message/provider/message_provider.dart';
import 'package:flutter_realtime/features/welcome/presentation/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => MessageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: TrackContext.key,
        routes: {
          SplashScreen.myRoute: (BuildContext context) => const SplashScreen(),
          Login.myRoute: (BuildContext context) => const Login(),
          SignUp.myRoute: (BuildContext context) => const SignUp(),
          MessageHome.myRoute: (BuildContext context) => const MessageHome(),
        },
        builder: (BuildContext context, final child) => Stack(
          children: [
            child!,
            Selector<AppState, bool>(
              selector: (_, appState) => appState.showLoading,
              builder: (context, showLoading, child) {
                if (showLoading) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blueAccent.withOpacity(0.2),
                    child: const CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
