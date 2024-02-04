import 'dart:developer';

import 'package:dafitzone/app/screens/program_screens/widgets/program_numbers.dart';
import 'package:dafitzone/app/widgets/custom_app_bar.dart';
import 'package:dafitzone/data/models/program_model.dart';
import 'package:flutter/material.dart';

import '../../data/models/meal_element_model.dart';

class FoodElementDetailsScreen extends StatelessWidget {
  final DietProgramMealElement element;
  final ProgramModel program;
  const FoodElementDetailsScreen(
      {super.key, required this.element, required this.program});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          context,
          title: 'تفاصيل ال${element.foodElement.name}',
        ),
        body: SafeArea(
            minimum: const EdgeInsets.all(16),
            child: Column(
              children: [
                ProgramNumberStatus(
                  calories: element.foodElement.calories.round().toString(),
                  carbs: "${element.foodElement.carbohydrates.round()}g",
                  protein: "${element.foodElement.protein.round()}g",
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("البروتينات",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("${element.foodElement.protein}g",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text(
                        "${element.getProteinPercentage(program.totalProtein)}%",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("الكربوهيدرات",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("${element.foodElement.carbohydrates}g",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text("${element.getCarbsPercentage(program.totalCarbs)}%",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("الدهون",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("${element.foodElement.fat}g",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text("${element.getFatPercentage(program.totalFats)}%",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("الألياف",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("${element.foodElement.fiber}g",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text("${element.getFiberPercentage(program.totalFibers)}%",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("السكريات",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text("${element.foodElement.sugar}g",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Text("${element.getSugerPercentage(program.totalSugars)}%",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.grey))
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(color: Colors.black),
                ListTile(
                  title: Text("${element.quantity} قطعة",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  subtitle: Text(
                      element.foodElement.description.isEmpty
                          ? "لا يوجد ملاحظات"
                          : element.foodElement.description,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                ),
              ],
            )));
  }
}
