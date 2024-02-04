import 'meal_model.dart';

class ProgramModel {
  final int id;
  final String programName;
  final dynamic programNote;
  final bool isMain;
  final DateTime createdAt;
  final List<DietProgramMeal> dietProgramMeal;

  ProgramModel({
    required this.id,
    required this.programName,
    required this.programNote,
    required this.isMain,
    required this.createdAt,
    required this.dietProgramMeal,
  });

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        programName: json["program_name"],
        programNote: json["program_note"],
        isMain: json["is_main"] == "1" ? true : false,
        createdAt: DateTime.parse(json["created_at"]),
        dietProgramMeal: List<DietProgramMeal>.from(
            json["diet_program_meal"].map((x) => DietProgramMeal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "program_name": programName,
        "program_note": programNote,
        "is_main": isMain,
        "created_at": createdAt.toIso8601String(),
        "diet_program_meal":
            List<dynamic>.from(dietProgramMeal.map((x) => x.toJson())),
      };

  String get totalCalories {
    return '${totalCaloriesInt.round()}';
  }

  String get totalProteinInGrams {
    return '${totalProtein.round()}g';
  }

  String get totalCarbsInGrams {
    return "${totalCarbs.round()}g";
  }

  double get totalCaloriesInt => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.calories * element.quantity).toInt()));

  double get totalProtein => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.protein * element.quantity)
                      .toDouble()));

  double get totalCarbs => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.carbohydrates * element.quantity)
                      .toDouble()));

  // fats
  double get totalFats => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.fat * element.quantity).toDouble()));

  // fibers
  double get totalFibers => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.fiber * element.quantity).toDouble()));

  double get totalSugars => dietProgramMeal.fold(
      0,
      (previousValue, element) =>
          previousValue +
          element.dietProgramMealElement.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.foodElement.sugar * element.quantity).toDouble()));
}
