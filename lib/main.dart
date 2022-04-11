import 'package:flutter/material.dart';

import 'MyApp.dart';
// import 'testFormatCode.dart';

void main() {
  runApp(MaterialApp(
    title: 'My App',
    theme: ThemeData(
      primaryColor: Colors.green[300],
    ),
    home: const MyApp(),
  )); // sent arguments / params to this Widget
}
