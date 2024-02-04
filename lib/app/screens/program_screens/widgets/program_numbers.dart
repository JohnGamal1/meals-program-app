import 'package:flutter/material.dart';


class ProgramNumberStatus extends StatelessWidget {
  final String carbs;
  final String calories;
  final String protein;
  const ProgramNumberStatus({super.key, required this.carbs, required this.calories, required this.protein});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(carbs,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          )),
                  Text('الكارب',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(calories,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          )),
                  Text('سعرات',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(protein,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          )),
                  Text('البروتينات',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
