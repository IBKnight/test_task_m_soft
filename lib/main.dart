import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test_task_m_soft/features/app.dart';

void main() async {
  runZonedGuarded(() => runApp(const TestApp()), (error, stack) {
    log('Error: ${error.toString()}');
    log('Stack Trace: ${stack.toString()}');
  });
}
