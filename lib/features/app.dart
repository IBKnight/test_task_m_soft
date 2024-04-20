import 'package:flutter/material.dart';
import 'package:test_task_m_soft/common/palette.dart';
import 'package:test_task_m_soft/features/card_list/presentation/screen/card_list_screen.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task MS',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(color: Palette.title),
            iconTheme: IconThemeData(color: Palette.title),
            shadowColor: Colors.transparent
          ),
          useMaterial3: false),
      home: const CardListScreen(),
    );
  }
}
