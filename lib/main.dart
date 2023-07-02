import 'package:flutter/material.dart';

void main() => runApp(const TokenSystem());

class TokenSystem extends StatelessWidget {
  const TokenSystem({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Token Management System',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      // A widget which will be started on application startup
      home: const TokenSystemHome(title: 'Token Management System'),
    );
  }
}

class TokenSystemHome extends StatelessWidget {
  final String title;
  const TokenSystemHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // The title text which will be shown on the action bar
        title: Text(title),
      ),
      body: const Center(
        child: Text(
          'Welcome to Token Management',
        ),
      ),
    );
  }
}
