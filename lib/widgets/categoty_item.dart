import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

class CategotyItem extends StatelessWidget {
  const CategotyItem(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  final String id;
  final String title;
  final String imageUrl;

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
