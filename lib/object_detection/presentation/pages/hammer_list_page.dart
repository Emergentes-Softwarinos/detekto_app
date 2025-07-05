import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Hammer {
  final String nombre;
  final int cantidad;
  final double precio;

  Hammer({required this.nombre, required this.cantidad, required this.precio});

  factory Hammer.fromJson(Map<String, dynamic> json) {
    return Hammer(
      nombre: json['nombre'],
      cantidad: json['cantidad'],
      precio: (json['precio'] as num).toDouble(),
    );
  }
}

class HammerListPage extends StatefulWidget {
  const HammerListPage({super.key});

  @override
  State<HammerListPage> createState() => _HammerListPageState();
}

class _HammerListPageState extends State<HammerListPage> {
  List<Hammer> hammers = [];

  @override
  void initState() {
    super.initState();
    fetchHammers();
  }

  Future<void> fetchHammers() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:8000/martillos'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          hammers = data.map((json) => Hammer.fromJson(json)).toList();
        });
      } else {
        throw Exception('Fallo al cargar martillos');
      }
    } catch (e) {
      print("Error al obtener martillos: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Martillos")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'http://10.0.2.2:8000/ultima-imagen?timestamp=${DateTime.now().millisecondsSinceEpoch}',
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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hammers.length,
              itemBuilder: (context, index) {
                final hammer = hammers[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  child: ListTile(
                    leading: const Icon(Icons.construction),
                    title: Text(hammer.nombre),
                    subtitle: Text(
                        "Stock: ${hammer.cantidad}  |  Precio: S/ ${hammer.precio.toStringAsFixed(2)}"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
