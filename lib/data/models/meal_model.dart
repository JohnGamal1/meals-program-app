import 'meal_element_model.dart';

class DietProgramMeal {
  final int id;
  final String mealName;
  final List<DietProgramMealElement> dietProgramMealElement;

  DietProgramMeal({
    required this.id,
    required this.mealName,
    required this.dietProgramMealElement,
  });

  factory DietProgramMeal.fromJson(Map<String, dynamic> json) =>
      DietProgramMeal(
        id: json["id"],
        mealName: json["meal_name"],
        dietProgramMealElement: List<DietProgramMealElement>.from(
            json["diet_program_meal_element"]
                .map((x) => DietProgramMealElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meal_name": mealName,
        "diet_program_meal_element":
            List<dynamic>.from(dietProgramMealElement.map((x) => x.toJson())),
      };
}
