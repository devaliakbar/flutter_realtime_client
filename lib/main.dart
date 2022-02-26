import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/helper/track_context.dart';
import 'package:flutter_realtime/core/route/app_router.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:flutter_realtime/features/message/provider/message_provider.dart';
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
        onGenerateRoute: AppRouter.onGenerateRoute,
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
