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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen superior desde tu backend
            Image.network(
              'http://10.0.2.2:8000/ultima-imagen?timestamp=${DateTime.now().millisecondsSinceEpoch}', // Cambia si usas otro host o dispositivo real
              fit: BoxFit.contain,
              width: double.infinity,
              errorBuilder: (context, error, stackTrace) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("No se pudo cargar la imagen"),
                );
              },
            ),
            const SizedBox(height: 16),
            // Lista de martillos en Cards
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // para que el scroll funcione con el padre
              itemCount: hammers.length,
              itemBuilder: (context, index) => Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 4,
                child: ListTile(
                  leading: const Icon(Icons.construction),
                  title: Text(hammers[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
