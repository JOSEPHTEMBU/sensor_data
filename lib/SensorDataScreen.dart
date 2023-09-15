// import 'dart:convert';
// import 'dart:convert';
//  import 'package:flutter/material.dart';
//  import 'SensorData.dart';
//  import 'package:http/http.dart' as http;
//  import 'package:charts_flutter/flutter.dart' as charts;
// //
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'SensorData.dart';
//
// class SensorDataScreen extends StatefulWidget {
//   @override
//   _SensorDataScreenState createState() => _SensorDataScreenState();
// }
//
// class _SensorDataScreenState extends State<SensorDataScreen> {
//   List<SensorData> sensorDataList = [];
//
//   Future<void> fetchSensorData() async {
//    // print('Response');
//    // print('Response');
//    // print('Response');
//    // print('Response');
//    // print('Response');
//
//    final response = await http.get(Uri.parse('https://site2.upande.com/api/resource/PH Sensor Data?fields=["device", "bat","timestamp","ph1_soil","temp_soil","tempc_ds18b20"]'));
//     if (response.statusCode == 200) {
//       print(response.statusCode);
//       print(response);
//
//       final jsonData = json.decode(response.body);
//       setState(() {
//         sensorDataList = List.from(jsonData).map((data) => SensorData.fromJson(data)).toList();
//       });
//     } else {
//       // Handle error if API request fails
//       print('Failed to fetch sensor data: ${response.statusCode}');
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     fetchSensorData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sensor Data'),
//       ),
//       body: Center(
//         child: (sensorDataList.isEmpty)
//             ? CircularProgressIndicator()
//             : buildChart(),
//       ),
//     );
//   }
//
//   Widget buildChart() {
//     final data = sensorDataList.map((data) {
//       return charts.Series<SensorData, String>(
//         id: 'Sensor Data',
//         domainFn: (SensorData data, _) => data.device,
//         measureFn: (SensorData data, _) => data.ph1Soil,
//         data: [data],
//       );
//     }).toList();
//
//     return charts.BarChart(
//       data,
//       animate: true,
//       vertical: false,
//     );
//   }
// }
import 'dart:convert';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'SensorData.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;
//
import 'package:flutter/material.dart';

import 'SensorData.dart';

class SensorDataScreen extends StatefulWidget {
  @override
  _SensorDataScreenState createState() => _SensorDataScreenState();
}

class _SensorDataScreenState extends State<SensorDataScreen> {
  List<SensorData> sensorDataList = [];

  @override
  void initState() {
    super.initState();
    fetchSensorData();
  }

  Future<void> fetchSensorData() async {
    final Map<String, String> requestHeaders = {
      "Authorization": "Token 26ca079da4006d3:ae3b0b496621784",
    };

    final response = await http.get(
      Uri.parse(
          'https://site2.upande.com/api/resource/PH Sensor Data?fields=["device","bat","timestamp","ph1_soil","temp_soil","tempc_ds18b20"]'),
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      var dataList = jsonData['data'];

      setState(() {
        sensorDataList = (dataList as List)
            .map((json) => SensorData.fromJson(json))
            .toList();
      });
    } else {
      print('Failed to fetch sensor data: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Data'),
      ),
      body: Center(
        child: (sensorDataList.isEmpty)
            ? CircularProgressIndicator()
            : buildChart(),
      ),
    );
  }

  Widget buildChart() {
    final data = sensorDataList.map((data) {
      return charts.Series<SensorData, String>(
        id: 'Sensor Data',
        domainFn: (SensorData data, _) => data.device,
        measureFn: (SensorData data, _) => data.ph1Soil,
        data: [data],
      );
    }).toList();

    return charts.BarChart(
      data,
      animate: true,
      vertical: false,
    );
  }
}
