import 'package:flutter/material.dart';
import 'package:flutter_realtime/features/welcome/presentation/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.myRoute: (BuildContext context) => const SplashScreen(),
      },
    );
  }
}
