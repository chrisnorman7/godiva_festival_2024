import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'src/screens/acts_builder.dart';

void main() {
  runApp(const MyApp());
}

/// The top-level app class.
class MyApp extends StatelessWidget {
  /// Create an instance.
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    RendererBinding.instance.ensureSemantics();
    return MaterialApp(
      title: 'Godiva Festival 2024',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ActsBuilder(),
    );
  }
}
