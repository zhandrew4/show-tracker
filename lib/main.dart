import 'package:flutter/material.dart';

import 'list_menu_screen.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Show Tracker',
      initialRoute: '/',
      routes: {
        '/': (context) => const ListMenuScreen(title: 'My Lists'),
      }
    )
  );
}





