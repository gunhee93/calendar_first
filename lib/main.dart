import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // 플러터 프레임워크가 준비될 때까지 대기
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}
