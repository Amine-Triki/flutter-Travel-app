import 'package:flutter/material.dart';

import '../app_data.dart';
import '../widgets/categoty_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دليل السياحي'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 7 / 8,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: categoriesData
            .map(
              (categoryData) => CategotyItem(
                id: categoryData.id,
                title: categoryData.title,
                imageUrl: categoryData.imageUrl,
              ),
            )
            .toList(),
      ),
    );
  }
}
