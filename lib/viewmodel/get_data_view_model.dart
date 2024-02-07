import 'dart:io';
import 'package:demo_app/model/get_data_model.dart';
import 'package:demo_app/remote/repository/app_repository_impl.dart';
import 'package:get/get.dart';
import '../remote/exceptions/app_exceptions.dart';
import '../remote/response/api_response.dart';

class GetDataViewModel extends GetxController {
  final _api = AppRepositoryImpl();

  Rx<ApiResponse<List<GetDataModel>>> baseResponse =
      ApiResponse<List<GetDataModel>>.loading().obs;

  void fetchDataFromApi() async {
    _setData(ApiResponse.loading());

    try {
      final data = await _api.getData();
      _setData(ApiResponse.completed(data));
    } on SocketException {
      _setData(ApiResponse.error('No Internet Connection'));
    } on BadRequestException {
      _setData(ApiResponse.error('Bad request'));
    } on UnauthorisedException {
      _setData(ApiResponse.error('Unauthorized'));
    } on FetchDataException {
      _setData(ApiResponse.error(
          'An error occurred while communicating with the server'));
    } catch (e) {
      _setData(ApiResponse.error('An unknown error occurred: ${e.toString()}'));
    }
  }

  void _setData(ApiResponse<List<GetDataModel>> response) {
    baseResponse.value = response;
  }
}
