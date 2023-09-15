class SensorData {
  final String device;
  final double bat;
  final DateTime timestamp;
  final double ph1Soil;
  final double tempSoil;
  final double tempDS18B20;

  SensorData({
    required this.device,
    required this.bat,
    required this.timestamp,
    required this.ph1Soil,
    required this.tempSoil,
    required this.tempDS18B20,
  });

  factory SensorData.fromJson(Map<String, dynamic> json) {
    return SensorData(
      device: json['device'],
      bat: json['bat'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
      ph1Soil: json['ph1_soil'].toDouble(),
      tempSoil: json['temp_soil'].toDouble(),
      tempDS18B20: json['tempc_ds18b20'].toDouble(),
    );
  }
}
