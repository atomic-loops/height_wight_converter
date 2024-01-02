# ScreenSizeConverter for Flutter

`ScreenSizeConverter` is a utility class designed for Flutter developers to create responsive applications. It provides methods to scale heights, widths, and text sizes according to the device's screen dimensions, ensuring a consistent UI across different devices and screen sizes.

## Features

- Responsive scaling of height, width, and text size.
- Customizable base dimensions for mobile, web, and desktop platforms.
- Easy integration into any Flutter project.

## Getting Started

### Integration

1. Copy the `ScreenSizeConverter` class into your Flutter project.

2. Initialize the `ScreenSizeConverter` in the `build` method of your main application widget:

    ```dart
    void main() {
      runApp(MyApp());
    }

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        // Initialize ScreenSizeConverter
        ScreenSizeConverter.initialize(context);

        return MaterialApp(
          // ... other MaterialApp properties ...
          home: MyHomePage(),
        );
      }
    }
    ```

### Usage

Use the `ScreenSizeConverter` instance to scale dimensions in your widgets. This includes scaling heights, widths, and text sizes:

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scaler = ScreenSizeConverter.instance;

    return Scaffold(
      // ... AppBar, etc. ...
      body: Column(
        children: [
          Container(
            height: scaler.scaleHeight(200),
            width: scaler.scaleWidth(100),
            // ... other properties ...
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
    );
  }
}
```

### Customizing Default Values

To adjust the default base dimensions for different platforms:

1. Open the `ScreenSizeConverter` class.

2. Change the static constants at the beginning of the class to your desired dimensions:

    ```dart
    static const double mobileBaseHeight = 800.0;
    static const double mobileBaseWidth = 360.0;
    static const double webBaseHeight = 1080.0;
    static const double webBaseWidth = 1920.0;
    static const double desktopBaseHeight = 900.0;
    static const double desktopBaseWidth = 1600.0;
    ```

