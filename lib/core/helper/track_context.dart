import 'package:flutter/material.dart';

class TrackContext {
  static final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  static BuildContext getCurrentContext() {
    return key.currentContext!;
  }
}
