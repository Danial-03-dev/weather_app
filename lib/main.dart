import "package:flutter/material.dart";
import "package:weather_app/screens/weahter_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeahterScreen(),
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
