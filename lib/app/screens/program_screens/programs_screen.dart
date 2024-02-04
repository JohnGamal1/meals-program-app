import 'package:dafitzone/app/widgets/custom_app_bar.dart';
import 'package:dafitzone/data/models/program_response_model.dart';
import 'package:dafitzone/services/api_service.dart';
import 'package:flutter/material.dart';
import '../../../data/repositories/diet_programs_repository.dart';
import 'widgets/meal_element.dart';
import 'widgets/program_numbers.dart';

class ProgramsScreen extends StatelessWidget {
  const ProgramsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(context,autoFocus: true,),
        body: FutureBuilder<ProgramResponseModel>(
          future: getPrograms(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final programs = snapshot.data!.data.programs;
              final mainProgram =
                  programs.firstWhere((program) => program.isMain);
              var pastPrograms = programs.where((program) {
                return !program.isMain;
              }).toList();
              return SafeArea(
                minimum: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "متوسط نسب الوجبات في اليوم",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 10),
                    ProgramNumberStatus(
                      calories: mainProgram.totalCalories.toString(),
                      carbs: mainProgram.totalCarbsInGrams.toString(),
                      protein: mainProgram.totalProteinInGrams.toString(),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            const TabBar(
                              tabs: [
                                Tab(text: 'النظام الحالي'),
                                Tab(text: 'الأنظمة السابقة'),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  ListView.builder(
                                    itemCount:
                                        mainProgram.dietProgramMeal.length,
                                    itemBuilder: (context, index) {
                                      final meal =
                                          mainProgram.dietProgramMeal[index];
                                      return ListTile(
                                        title: Text("وجبة ال${meal.mealName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                        subtitle: Column(
                                          children: [
                                            ...meal.dietProgramMealElement
                                                .map((element) {
                                              return MealElementTile(
                                                  element: element,
                                                  program: mainProgram);
                                            }),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  pastPrograms.isEmpty
                                      ? const Center(
                                          child: Text('لا يوجد أنظمة سابقة'),
                                        )
                                      : ListView.builder(
                                          itemCount: pastPrograms.length,
                                          itemBuilder: (context, index) {
                                            final programs =
                                                pastPrograms[index];
                                            return ListTile(
                                              title:
                                                  Text(programs.programName),
                                            );
                                          },
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }

  Future<ProgramResponseModel> getPrograms() async {
    final ApiService apiService =
        ApiService(baseUrl: 'https://app.dafitzone.com/api/v1');
    return ProgramsRepository(apiService: apiService).fetchPrograms();
  }
}
