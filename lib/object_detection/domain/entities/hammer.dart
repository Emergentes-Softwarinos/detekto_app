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
