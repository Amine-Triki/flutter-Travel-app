import 'package:flutter/material.dart';
import 'package:travel_app/app_data.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen(this.manageFavorite, this.isFavorite, {super.key});

  static const screenRoute = '/trip-detail';
  final Function(String) manageFavorite;
  final Function(String) isFavorite;
  Widget buildSectionTitle(BuildContext context, String titleText) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      alignment: Alignment.topRight,
      child: Text(
        titleText,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  Widget buildListViewContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final tripId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedTrip = Trips_data.firstWhere((trip) => trip.id == tripId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTrip.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedTrip.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'الأنشطة'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.activities.length,
                itemBuilder: (ctx, index) => Card(
                  elevation: 0.3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    child: Text(selectedTrip.activities[index]),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, 'البرنامج اليومي'),
            buildListViewContainer(
              ListView.builder(
                itemCount: selectedTrip.program.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(' يوم ${index + 1}'),
                      ),
                      title: Text(selectedTrip.program[index]),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => manageFavorite(tripId),
        child: Icon(isFavorite(tripId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
