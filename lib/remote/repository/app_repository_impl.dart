import 'package:demo_app/model/get_data_model.dart';

import '../api/api_endpoints.dart';
import '../api/api_service.dart';
import '../api/base_api_service.dart';
import '../../model/login_model.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<List<GetDataModel>> getData() async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndPoints.getData);

      if (response is List) {
        List<GetDataModel> jsonData =
            response.map((item) => GetDataModel.fromJson(item)).toList();
        return jsonData;
      } else {
        throw const FormatException('Received data is not a list');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LoginModel> postData(LoginModel model) async {
    try {
      dynamic response =
          await _apiService.postResponse(ApiEndPoints.loginApi, model.toJson());

      if (response.isNotEmpty) {
        LoginModel jsonData = LoginModel.fromJson(response);
        return jsonData;
      } else {
        throw const FormatException('Received data is not in correct format');
      }
    } catch (e) {
      rethrow;
    }
  }
}
