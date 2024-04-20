import 'package:flutter/material.dart';
import 'package:test_task_m_soft/features/card_list/presentation/screen/card_list_screen.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Task MS',
      theme: ThemeData(
        // useMaterial3: true,
      ),
      home: const CardListScreen(),
    );
  }
}
