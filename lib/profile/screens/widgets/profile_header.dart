import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF5DB075),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      width: double.infinity,
      child: const Column(
        children: [
          SizedBox(height: 12),
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/women/65.jpg"),
          ),
          SizedBox(height: 12),
          Text(
            "Abel Anderson",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            "Me gustan los gorros",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
