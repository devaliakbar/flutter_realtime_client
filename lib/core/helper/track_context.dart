import 'package:flutter/material.dart';

class TrackContext {
  static final GlobalKey key = GlobalKey();

  static BuildContext? getCurrentContext() {
    return key.currentContext;
  }
}
