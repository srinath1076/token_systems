import 'package:flutter/material.dart';
import 'package:token_system/view/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:token_system/view/user_view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Token Management System',
      theme: ThemeData(
        // Define a default theme if needed
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: UserView(), // Set UserView as the initial view
      ),
    );
  }
}

/** 
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
*/
