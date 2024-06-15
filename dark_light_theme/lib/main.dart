import 'package:dark_light_theme/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).getThemeData(),
        home: const HomePage(),
      ),
    );
  }
}



//Another Approach

// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => ThemeProvider(),
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: Provider.of<ThemeProvider>(context).getThemeData(),
//       home: const HomePage(),
//     );
//   }
// }
