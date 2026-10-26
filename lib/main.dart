import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RGB Color Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RgbPickerScreen(),
    );
  }
}

class RgbPickerScreen extends StatefulWidget {
  const RgbPickerScreen({super.key});

  @override
  State<RgbPickerScreen> createState() => _RgbPickerScreenState();
}

class _RgbPickerScreenState extends State<RgbPickerScreen> {
  double _red = 50.0;
  double _green = 120.0;
  double _blue = 200.0;

  @override
  Widget build(BuildContext context) {
    Color currentColor = Color.fromRGBO(
      _red.toInt(),
      _green.toInt(),
      _blue.toInt(),
      1.0,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('RGB Color Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: currentColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),


            _buildColorSlider(
              label: 'Red: ${_red.toInt()}',
              value: _red,
              activeColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _red = value;
                });
              },
            ),

            _buildColorSlider(
              label: 'Green: ${_green.toInt()}',
              value: _green,
              activeColor: Colors.green,
              onChanged: (value) {
                setState(() {
                  _green = value;
                });
              },
            ),

            _buildColorSlider(
              label: 'Blue: ${_blue.toInt()}',
              value: _blue,
              activeColor: Colors.blue,
              onChanged: (value) {
                setState(() {
                  _blue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorSlider({
    required String label,
    required double value,
    required Color activeColor,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Slider(
          value: value,
          min: 0,
          max: 255,
          divisions: 255,
          activeColor: activeColor,
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}