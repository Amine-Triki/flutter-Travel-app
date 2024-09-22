import 'package:flutter/material.dart';
import '../widgets/trip_item.dart';
import '../app_data.dart';

class CategoryTripsScreen extends StatelessWidget {
  static const screenRoute = '/categoty-trips';
  const CategoryTripsScreen({super.key});

  // const CategoryTripsScreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});
  // final String categoryId;
  // final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['title'];
    final filteredTrips = Trips_data.where((trip) {
      return trip.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemCount: filteredTrips.length,
        itemBuilder: (ctx, index) {
          return TripItem(
            title: filteredTrips[index].title,
            imageUrl: filteredTrips[index].imageUrl,
            duration: filteredTrips[index].duration,
            tripeType: filteredTrips[index].tripType,
            season: filteredTrips[index].season,
          );
        },
      ),
    );
  }
}
