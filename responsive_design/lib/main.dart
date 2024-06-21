import 'package:flutter/material.dart';
import 'package:responsive_design/scaffolds/desktop_scaffold.dart';
import 'package:responsive_design/scaffolds/mobile_scaffold.dart';
import 'package:responsive_design/scaffolds/responsive_layout.dart';
import 'package:responsive_design/scaffolds/tablet_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
