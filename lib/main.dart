import 'package:flutter/material.dart';
import 'package:height_wight_converter/utils/height_wight_converter_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenSizeConverter.initialize(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
