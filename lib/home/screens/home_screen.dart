import 'package:detekto_app/home/screens/widgets/home_search_bar.dart';
import 'package:detekto_app/home/screens/widgets/recent_sales_button.dart';
import 'package:detekto_app/home/screens/widgets/scanner_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Oculta el teclado si se hace tap fuera de un TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Center(
                    child: Text(
                      'Inicio',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  HomeSearchBar(),
                  SizedBox(height: 30),
                  RecentSalesButton(),
                  SizedBox(height: 63),
                  Center(child: ScannerButton()),
                  SizedBox(height: 35),
                  Center(
                    child: Text(
                      'Escanea el producto',
                      style: TextStyle(color: Colors.green, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            fixedColor: const Color.fromARGB(255, 16, 184, 72),
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.store), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
            currentIndex: 0,
            onTap: (index) {
              // TODO: navegación por índice
            },
          ),
        ),
      ),
    );
  }
}
