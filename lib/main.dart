import 'package:devtools_flutter/di/locator.dart';
import 'package:devtools_flutter/app.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
