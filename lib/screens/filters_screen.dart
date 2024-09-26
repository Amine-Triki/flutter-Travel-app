import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  static const screenRoute = '/filters';

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isInSommer = false;
  var _isInWinter = false;
  var _isForFamily = false;

  SwitchListTile buildSwitchListTile(String title, String subtitle,
      bool currentValue, ValueChanged<bool> updateValue) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,

      activeColor: Colors.blue, // لون الزر عند التفعيل
      inactiveThumbColor: Colors.grey, // لون الزر عند التعطيل
      inactiveTrackColor: Colors.grey[300], // لون شريط التبديل عند التعطيل
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الفلترة'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(' فقط الرحلات الصيفية',
                    'إظهار الرحلات في فصل الصيف فقط', _isInSommer, (newValue) {
                  setState(() {
                    _isInSommer = newValue;
                  });
                }),
                buildSwitchListTile(' فقط الرحلات الشتوية',
                    'إظهار الرحلات في فصل الشتاء فقط', _isInWinter, (newValue) {
                  setState(() {
                    _isInWinter = newValue;
                  });
                }),
                buildSwitchListTile(
                    ' فقط الرحلات للعائلات',
                    'إظهار الرحلات التي  للعائلات فقط',
                    _isForFamily, (newValue) {
                  setState(() {
                    _isForFamily = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
