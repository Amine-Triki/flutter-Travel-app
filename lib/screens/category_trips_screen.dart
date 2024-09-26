import 'package:flutter/material.dart';
import '../models/trip.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/categoty-trips';
  const CategoryTripsScreen({super.key});

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  late String categoryTitle;
  late List<Trip> displayTrips;
  bool _isInit = false;
  @override
  void didChangeDependencies() {
    if (!_isInit) {
      final routeArgument =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgument['id'];
      categoryTitle = routeArgument['title']!;
      displayTrips = Trips_data.where((trip) {
        return trip.categories.contains(categoryId);
      }).toList();
      _isInit = true;
    }
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            id: displayTrips[index].id,
            title: displayTrips[index].title,
            imageUrl: displayTrips[index].imageUrl,
            duration: displayTrips[index].duration,
            tripeType: displayTrips[index].tripType,
            season: displayTrips[index].season,
            removeItem: _removeTrip,
          );
        },
      ),
    );
  }
}
