import 'package:flutter/material.dart';
import '../screens/Favorites_screen.dart';
import '../screens/categories_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('دليل سياحي'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.dashboard),
              text: 'التصنيفات',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'المفضلة',
            ),
          ]),
        ),
        body: const TabBarView(children: [
          CategoriesScreen(),FavoritesScreen(),
        ]),
      ),
    );
  }
}
