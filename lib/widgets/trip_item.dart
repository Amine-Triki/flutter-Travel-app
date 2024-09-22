import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final TripType tripeType;
  final Season season;

  const TripItem(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.duration,
      required this.tripeType,
      required this.season});
  void selectTrip() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectTrip,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
