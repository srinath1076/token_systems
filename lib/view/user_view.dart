import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

class UserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;

    return MaterialApp(
      theme: ThemeData(
        primaryColor: theme.primaryColor,
        accentColor: theme.accentColor,
        textTheme: TextTheme(
          bodyText2: theme.textStyle,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('User View'),
        ),
        body: Column(
          children: [
            Image.asset(theme.logoPath),
            Text('Max Token: ${theme.maxToken}'),
            Text('Number of Collectors: ${theme.numCollectors}'),
            // Add more user-specific UI elements here
          ],
        ),
      ),
    );
  }
}
