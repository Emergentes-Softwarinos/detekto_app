import 'package:detekto_app/profile/screens/widgets/profile_header.dart';
import 'package:detekto_app/profile/screens/widgets/profile_tabs.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // ✅ Fondo blanco para evitar oscurecimiento
      width: double.infinity,
      height: double.infinity,
      child: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileHeader(),
              ProfileTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
