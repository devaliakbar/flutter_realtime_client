import 'package:flutter/material.dart';
import 'package:flutter_realtime/core/helper/track_context.dart';
import 'package:flutter_realtime/features/auth/presentation/screens/login.dart';
import 'package:flutter_realtime/features/auth/provider/app_state.dart';
import 'package:grpc/grpc.dart';
import 'package:provider/provider.dart';

class GrpcClientHelper {
  static const String defaultPath = "0.0.0.0";
  static const int defaultPort = 50051;

  static ClientChannel getChannel(
      {String path = defaultPath, int port = defaultPort}) {
    return ClientChannel(
      defaultPath,
      port: defaultPort,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }

  static Future<CallOptions> getAuthOptions(
      {bool navigateLoginIfInvalidToken = true}) async {
    final String? token =
        Provider.of<AppState>(TrackContext.getCurrentContext(), listen: false)
            .jwtToken;

    if (token == null) {
      if (navigateLoginIfInvalidToken) {
        Future.delayed(const Duration(seconds: 1)).then((value) => null).then(
            (value) => Navigator.of(TrackContext.getCurrentContext())
                .pushNamedAndRemoveUntil(
                    Login.myRoute, (Route<dynamic> route) => false));
      }

      throw "Authentication required";
    }

    return CallOptions(metadata: {"authorization": token});
  }
}
