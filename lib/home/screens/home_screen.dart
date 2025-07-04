import 'package:detekto_app/home/screens/widgets/home_search_bar.dart';
import 'package:detekto_app/home/screens/widgets/recent_sales_button.dart';
import 'package:detekto_app/home/screens/widgets/scanner_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
        color: Colors.white, // ✅ Fondo blanco sólido
        width: double.infinity,
        height: double.infinity,
        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
      ),
    );
  }
}
