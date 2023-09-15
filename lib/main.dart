import 'package:flutter/material.dart';
import 'SensorDataChart.dart';
import 'SensorDataScreen.dart';
void main() {
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensor Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SensorDataScreen(),
    );
  }
}

