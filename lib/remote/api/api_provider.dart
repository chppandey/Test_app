import 'dart:developer';

import 'package:demo_app/model/get_data_model.dart';
import 'package:demo_app/model/login_model.dart';
import 'package:demo_app/remote/api/api_endpoints.dart';
import 'package:demo_app/utils/local_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiProvider {
  final Dio _dio = Dio();
  SharedPref pref = SharedPref();

  ///--------- Login -----///
  Future<LoginResponseModel> loginApiCall(Map<String, dynamic> reqModel) async {
    Response response;
    if (kDebugMode) {
      print("login reqModel--> $reqModel");
    }
    try {
      _dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      response = await _dio.post(ApiEndPoints.loginApi, data: reqModel);
      if (kDebugMode) {
        log('--------Response Login : $response');
      }
      return LoginResponseModel.fromJson(response.data);
    } catch (error) {
      return LoginResponseModel.withError(error.toString());
    }
  }

  ///--------- getData -----///
  Future<GetDataModel> getData() async {
    Response response;
    String? token = await SharedPref().getUserToken() ?? "";

    print("data-token$token");

    try {
      _dio.options.headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        'Authorization': '$token'
      };
      response = await _dio.get(
        ApiEndPoints.getData,
        // queryParameters: {'m': true, 'user_id': 14, 'role_id': 1},
      );

      if (kDebugMode) {
        log('--------Response getData : $response');
      }
      if (response.statusCode == 200) {
        return GetDataModel.fromJson(response.data);
      } else {
        throw DioError(
          requestOptions: response.requestOptions,
          response: response,
        );
      }
    } catch (error) {
      rethrow;
    }
  }
}
