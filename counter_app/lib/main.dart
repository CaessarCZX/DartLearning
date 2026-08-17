import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counter/counter_screen.dart';

/// Main function is the root of the app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // Constructor of current widget, includes a param called 'key' which is used to map
  // the widget en the app's widget Tree
  // Always to use 'const' as type of data for the constructor in a StatelessWidget
  // This indicate that the values of widget never change and will be compiled in that way.
  const MyApp({super.key});

  @override
  //All StatelessWidget and StatefulWidget must have a build method, this is the same thing as 'render'
  Widget build(BuildContext context) {
    // Material App is a reusable widget class with atrributes or methods 
    // of 'Material Design UI'     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
      ),
      // Scaffold is the common layout in most applications includes: appbar, wrap menu, etc.
      home: CounterScreen(),
      );
  }
}
