class FoodElement {
  final int id;
  final String foodCategoryId;
  final String name;
  final String description;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fat;
  final double sugar;
  final double fiber;

  FoodElement({
    required this.id,
    required this.foodCategoryId,
    required this.name,
    required this.description,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
    required this.sugar,
    required this.fiber,
  });

  factory FoodElement.fromJson(Map<String, dynamic> json) => FoodElement(
        id: json["id"],
        foodCategoryId: json["food_category_id"],
        name: json["name"],
        description: json["description"],
        calories: double.parse(json["calories"].toString()),
        protein: double.parse(json["protein"].toString()),
        carbohydrates: double.parse(json["carbohydrates"].toString()),
        fat: double.parse(json["fat"].toString()),
        sugar: double.parse(json["sugar"].toString()),
        fiber: double.parse(json["fiber"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "food_category_id": foodCategoryId,
        "name": name,
        "description": description,
        "calories": calories,
        "protein": protein,
        "carbohydrates": carbohydrates,
        "fat": fat,
        "sugar": sugar,
        "fiber": fiber,
      };
}
