import 'package:detekto_app/profile/models/store_vendor.dart';
import 'package:detekto_app/profile/screens/widgets/profile_info_fields.dart';
import 'package:detekto_app/profile/screens/widgets/profile_photo_placeholder.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatefulWidget {
  final StoreVendor vendor;

  const ProfileTabs({super.key, required this.vendor});

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                _TabItem(
                  label: "Información",
                  selected: selectedTab == 0,
                  onTap: () => setState(() => selectedTab = 0),
                ),
                _TabItem(
                  label: "Fotos",
                  selected: selectedTab == 1,
                  onTap: () => setState(() => selectedTab = 1),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          selectedTab == 0
              ? ProfileInfoFields(vendor: widget.vendor)
              : const PhotoPlaceholder(),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? const Color(0xFF5DB075) : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
