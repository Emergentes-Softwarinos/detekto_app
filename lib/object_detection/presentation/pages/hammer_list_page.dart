import 'package:flutter/material.dart';

class HammerListPage extends StatelessWidget {
  const HammerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hammers = [
      "Martillo de carpintero",
      "Martillo de bola",
      "Martillo demoledor"
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Martillos")),
      body: ListView.builder(
        itemCount: hammers.length,
        itemBuilder: (context, index) => ListTile(title: Text(hammers[index])),
      ),
    );
  }
}
