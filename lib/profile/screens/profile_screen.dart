import 'package:detekto_app/profile/models/store_vendor.dart';
import 'package:detekto_app/profile/screens/widgets/profile_header.dart';
import 'package:detekto_app/profile/screens/widgets/profile_tabs.dart';
import 'package:detekto_app/profile/services/store_vendor_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  StoreVendor? vendor;
  bool isLoading = true;
  final storeVendorService = StoreVendorService();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    const storage = FlutterSecureStorage();

    try {
      final idStr = await storage.read(key: 'id');
      if (idStr == null) throw Exception('No ID found');

      final userId = int.parse(idStr);
      final data = await storeVendorService.getProfile(userId);
      setState(() {
        vendor = data;
        isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error cargando perfil: $e"),
      ));
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (vendor == null) {
      return const Center(child: Text("No se pudo cargar el perfil"));
    }

    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      width: double.infinity,
      height: double.infinity,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(
                vendor: vendor!,
                onImageUpdated:
                    _loadProfile, // 🟢 Se vuelve a ejecutar cuando se sube una imagen
              ),
              ProfileTabs(vendor: vendor!),
            ],
          ),
        ),
      ),
    );
  }
}
