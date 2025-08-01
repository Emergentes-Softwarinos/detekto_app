import 'package:detekto_app/shared/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Detekto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF4A148C),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: 'Poppins',
            ),
      ),
      routerConfig: routes,
    );
  }
}
