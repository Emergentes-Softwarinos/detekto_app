import 'package:detekto_app/profile/models/store_vendor.dart';
import 'package:detekto_app/shared/services/base_service.dart';

class StoreVendorService {
  final BaseService _baseService = BaseService();

  Future<StoreVendor> getProfile(int id) async {
    final response = await _baseService.get('store-vendors/$id');
    return StoreVendor.fromJson(response);
  }

  Future<StoreVendor> updateProfile({
    required int id,
    required String username,
    required String description,
    required String gender,
    required String age,
  }) async {
    final response = await _baseService.put('store-vendors/$id', {
      'username': username,
      'description': description,
      'gender': gender,
      'age': age,
    });

    return StoreVendor.fromJson(response);
  }

  Future<void> updateProfilePicture(int storeVendorId, String imagePath) async {
    // Usamos un PUT para el endpoint especificado
    await _baseService.uploadFile(
      'store-vendors/$storeVendorId/storeVendorImage', // Endpoint del backend
      'file', // Nombre del campo en el backend
      imagePath, // Ruta local del archivo
      method: 'PUT', // Usamos PUT
    );
  }
}
