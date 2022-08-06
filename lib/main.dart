import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'list_menu_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("show_tracker_app");
  
  runApp(
    MaterialApp(
      title: 'Show Tracker',
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 20),
          bodyMedium: TextStyle(fontSize: 18),
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ListMenuScreen(title: 'My Lists'),
      }
    )
  );
}





