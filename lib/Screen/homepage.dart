import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _apiController = TextEditingController();

  Future<void> getLOc() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("ss");
    _locationController.text = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
    _apiController.text = 'Api not working';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Open Weather"),
      ),
      body: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _apiController,
              readOnly: true, // Make the text field read-only
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Temperature',
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _apiController,
              readOnly: true, // Make the text field read-only
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Weather',
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _locationController,
              readOnly: true, // Make the text field read-only
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Location',
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              await getLOc();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
