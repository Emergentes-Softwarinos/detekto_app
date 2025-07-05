import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  int _getCurrentIndex(String location) {
    if (location.startsWith('/profile')) return 1;
    return 0;
  }

  String _getTitle(String location) {
    if (location.startsWith('/profile')) return 'Perfil';
    if (location.startsWith('/object-detection')) return 'Detección de Objetos';
    if (location.startsWith('/home')) return 'Inicio';
    return 'Inicio';
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _getCurrentIndex(location);
    final appBarTitle = _getTitle(location);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              context.go('/home');
            } else if (index == 1) {
              context.go('/profile');
            }
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home, isSelected: currentIndex == 0),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person, isSelected: currentIndex == 1),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, {required bool isSelected}) {
    if (isSelected) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: Color.fromARGB(255, 16, 184, 72)),
      );
    } else {
      return Icon(icon, color: Colors.black);
    }
  }
}
