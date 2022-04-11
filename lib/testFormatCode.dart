import 'package:flutter/material.dart';

class TestFormat extends StatelessWidget {
  const TestFormat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'tran thai quyen',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
