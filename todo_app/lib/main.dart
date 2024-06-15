import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDO",
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}
