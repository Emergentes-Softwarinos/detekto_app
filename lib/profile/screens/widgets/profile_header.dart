import 'package:detekto_app/profile/models/store_vendor.dart';
import 'package:detekto_app/profile/services/store_vendor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileHeader extends StatelessWidget {
  final StoreVendor vendor;
  final VoidCallback onImageUpdated; // <-- nuevo parámetro

  const ProfileHeader({
    super.key,
    required this.vendor,
    required this.onImageUpdated, // <-- requerido
  });

  Future<void> _changeProfilePicture(BuildContext context) async {
    final picker = ImagePicker();
    const storage = FlutterSecureStorage();
    final service = StoreVendorService();

    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final idStr = await storage.read(key: 'id');
      if (idStr == null) return;

      final userId = int.parse(idStr);
      try {
        await service.updateProfilePicture(userId, picked.path);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Foto actualizada')),
        );

        onImageUpdated(); // 🔁 Llama al callback para recargar perfil
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al subir imagen: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF5DB075),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => _changeProfilePicture(context),
            child: CircleAvatar(
              radius: 45,
              backgroundImage: vendor.imageUrl != null
                  ? NetworkImage(vendor.imageUrl!)
                  : const NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/6596/6596121.png'),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            vendor.username,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            vendor.description,
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
