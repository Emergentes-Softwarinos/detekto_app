class StoreVendor {
  final int id;
  final String username;
  final String description;
  final String email;
  final String gender;
  final int age;

  StoreVendor({
    required this.id,
    required this.username,
    required this.description,
    required this.email,
    required this.gender,
    required this.age,
  });

  factory StoreVendor.fromJson(Map<String, dynamic> json) {
    return StoreVendor(
      id: json['id'],
      username: json['username'],
      description: json['description'],
      email: json['email'],
      gender: json['gender'],
      age: json['age'],
    );
  }
}
