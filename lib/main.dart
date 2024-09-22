import 'package:flutter/material.dart';
import 'package:travel_app/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './screens/category_trips_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      title: 'Travel app',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.amber,
          ),
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
                headlineSmall: const TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
                titleLarge: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
        '/': (ctx) => const CategoriesScreen(),
        CategoryTripsScreen.screenRoute: (ctx) => const CategoryTripsScreen(),
      },
    );
  }
}
