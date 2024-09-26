import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const screenRoute = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FiltersScreen(this.currentFilters, this.saveFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  initState() {
    _summer = widget.currentFilters['summer']!;
    _winter = widget.currentFilters['winter']!;
    _family = widget.currentFilters['family']!;
    super.initState();
  }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'summer': _summer,
                'winter': _winter,
                'family': _family,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
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
                    'إظهار الرحلات في فصل الصيف فقط', _summer, (newValue) {
                  setState(() {
                    _summer = newValue;
                  });
                }),
                buildSwitchListTile(' فقط الرحلات الشتوية',
                    'إظهار الرحلات في فصل الشتاء فقط', _winter, (newValue) {
                  setState(() {
                    _winter = newValue;
                  });
                }),
                buildSwitchListTile(' فقط الرحلات للعائلات',
                    'إظهار الرحلات التي  للعائلات فقط', _family, (newValue) {
                  setState(() {
                    _family = newValue;
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
