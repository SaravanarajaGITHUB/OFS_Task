import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ofs_task/app.dart';
import 'package:ofs_task/locator.dart';

void main() {
  setUpRealLocator();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(App());
}
