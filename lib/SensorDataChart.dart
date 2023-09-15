// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'SensorData.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;
//
// class SensorDataChart extends StatefulWidget {
//   const SensorDataChart({super.key});
//
//   @override
//   _SensorDataChartState createState() => _SensorDataChartState();
// }
//
// class _SensorDataChartState extends State<SensorDataChart> {
//   List<SensorData> data = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     final response = await http.get(Uri.parse('https://site2.upande.com/api/resource/PH Sensor Data?fields=["device", "bat","timestamp","ph1_soil","temp_soil","tempc_ds18b20"]'));
//     if (response.statusCode == 200) {
//       final jsonData = json.decode(response.body);
//       final List<SensorData> sensorDataList = [];
//       for (var item in jsonData) {
//         sensorDataList.add(SensorData.fromJson(item));
//       }
//       setState(() {
//         data = sensorDataList;
//       });
//     } else {
//       // Handle API error
//       print('Failed to fetch sensor data');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sensor Data'),
//       ),
//       body: Center(
//         child: (data.isEmpty)
//             ? const CircularProgressIndicator()
//             : _buildChart(),
//       ),
//     );
//   }
//
//   Widget _buildChart() {
//     final List<charts.Series<SensorData, String>> series = [
//       charts.Series(
//         id: 'SensorData',
//         data: data,
//         domainFn: (SensorData sensorData, _) => sensorData.device,
//         measureFn: (SensorData sensorData, _) => sensorData.tempcDs18b20,
//       ),
//     ];
//
//     return charts.BarChart(
//       series,
//       animate: true,
//       vertical: false,
//       barRendererDecorator: charts.BarLabelDecorator<String>(),
//     );
//   }
// }
