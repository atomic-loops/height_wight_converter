import 'package:flutter/material.dart';
import 'package:height_wight_converter/utils/height_wight_converter_utils.dart';

class ConverterPage extends StatelessWidget {
  const ConverterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a local variable for easier access
    final scaler = ScreenSizeConverter.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text("Screen Size Converter Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: scaler.scaleHeight(200),
              width: scaler.scaleWidth(200),
              color: Colors.blue,
              alignment: Alignment.center,
              child: Text(
                'Responsive Container',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: scaler.scaleText(16),
                ),
              ),
            ),
            SizedBox(height: scaler.scaleHeight(20)),
            Text(
              'Responsive Text Size',
              style: TextStyle(
                fontSize: scaler.scaleText(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
