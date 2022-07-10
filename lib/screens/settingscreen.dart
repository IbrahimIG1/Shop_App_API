import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'SettingScreen',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ));
  }
}
