import 'dart:developer';

import 'package:dafitzone/data/models/program_model.dart';
import 'package:dafitzone/utils/presistance_bar_navigation.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/meal_element_model.dart';
import '../../food_element_screen.dart';

class MealElementTile extends StatelessWidget {
  final DietProgramMealElement element;
  final ProgramModel program;
  const MealElementTile(
      {super.key, required this.element, required this.program});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigation.instance.navigateToWithNavBar(context,
            FoodElementDetailsScreen(element: element, program: program));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.close, color: Colors.black54),
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 15,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/3/34/Apple_icon_2.png"),
            ),
            const SizedBox(width: 10),
            Text(element.foodElement.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(width: 10),
            Text("قطعة x${element.quantity}",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.grey)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
