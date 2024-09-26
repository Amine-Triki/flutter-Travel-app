import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('هذه صفحة فلترة'),
      ),
    );
  }
}
