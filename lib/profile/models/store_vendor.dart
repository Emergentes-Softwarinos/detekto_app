class StoreVendor {
  final int id;
  final String username;
  final String email;
  final String description;
  final String gender;
  final String age;
  final String? imageUrl;

  StoreVendor({
    required this.id,
    required this.username,
    required this.email,
    required this.description,
    required this.gender,
    required this.age,
    this.imageUrl,
  });

  factory StoreVendor.fromJson(Map<String, dynamic> json) {
    return StoreVendor(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      description: json['description'],
      gender: json['gender'],
      age: json['age'],
      imageUrl: json['imageUrl'],
    );
  }
}
