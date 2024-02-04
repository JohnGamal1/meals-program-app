import 'dart:developer';

import 'package:dafitzone/data/models/program_response_model.dart';
import '../../services/api_service.dart';

class ProgramsRepository {
  final ApiService apiService;

  ProgramsRepository({required this.apiService});

  Future<ProgramResponseModel> fetchPrograms() async {
    try {
      final Map<String, dynamic> data =
          await apiService.fetchData('trainne/diet-programs?id=78');
      ProgramResponseModel dataModel = ProgramResponseModel.fromJson(data);
      return dataModel;
    } catch (error) {
      log('Error fetching data from API: $error');
      rethrow;
    }
  }
}
