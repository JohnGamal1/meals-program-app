import 'food_element_model.dart';

class DietProgramMealElement {
  final int id;
  final int quantity;
  final FoodElement foodElement;

  DietProgramMealElement({
    required this.id,
    required this.quantity,
    required this.foodElement,
  });

  factory DietProgramMealElement.fromJson(Map<String, dynamic> json) =>
      DietProgramMealElement(
        id: json["id"],
        quantity: int.parse(json["quantity"].toString()),
        foodElement: FoodElement.fromJson(json["food_element"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "food_element": foodElement.toJson(),
      };

  double getProteinPercentage(double totalProtein) =>
      double.parse(((foodElement.protein * quantity) / totalProtein * 100)
          .toStringAsFixed(2));

  double getCaloriesPercentage(double totalCalories) =>
      double.parse(((foodElement.calories * quantity) / totalCalories * 100)
          .toStringAsFixed(2));

  double getCarbsPercentage(double totalCarbs) =>
      double.parse(((foodElement.carbohydrates * quantity) / totalCarbs * 100)
          .toStringAsFixed(2));

  double getFatPercentage(double totalFat) => double.parse(
      ((foodElement.fat * quantity) / totalFat * 100).toStringAsFixed(2));

  double getFiberPercentage(double totalFiber) => double.parse(
      ((foodElement.fiber * quantity) / totalFiber * 100).toStringAsFixed(2));

  double getSugerPercentage(double totalSugar) => double.parse(
      ((foodElement.sugar * quantity) / totalSugar * 100).toStringAsFixed(2));
}
