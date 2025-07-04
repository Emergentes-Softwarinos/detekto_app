import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({super.key, required this.child});

  // Devuelve el índice actual del tab en función de la ruta activa
  int _getCurrentIndex(String location) {
    if (location.startsWith('/profile')) return 1;
    return 0; // Default: /home
  }

  // Devuelve el título dinámico del AppBar
  String _getTitle(String location) {
    if (location.startsWith('/profile')) return 'Perfil';
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          // Navegación por contexto
          if (index == 0) {
            context.go('/home');
          } else if (index == 1) {
            context.go('/profile');
          }
        },
        fixedColor: const Color.fromARGB(255, 16, 184, 72),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        iconSize: 30,
        selectedIconTheme: const IconThemeData(size: 30),
        unselectedIconTheme: const IconThemeData(size: 30),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
