import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
        Scaffold(
          body: 
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello world in Flutter',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.language,
                    size: 95,
                    color: Colors.lightBlue,
                  ),
                ],
              )
            ),
        )
    );
  }
}
