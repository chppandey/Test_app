import 'dart:io';
import 'package:demo_app/model/get_data_model.dart';
import 'package:demo_app/remote/repository/app_repository_impl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../remote/exceptions/app_exceptions.dart';
import '../model/login_model.dart';
import '../remote/response/api_response.dart';

class LoginViewModel extends GetxController {
  final _api = AppRepositoryImpl();

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool isEmailValidate = false.obs;
  RxBool isPasswordValidate = false.obs;
  RxBool isPasswordVisible = true.obs;

  togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  clearController() {
    emailController.value.clear();
    passwordController.value.clear();
    isPasswordVisible.value = true;
  }

  RxBool isEmail(String input) => EmailValidator.validate(input).obs;
  setEmailValidate(String input) {
    if (isEmail(input).value) {
      isEmailValidate(true);
    } else {
      isEmailValidate(false);
    }
  }

  setPasswordValidate(String value) {
    if (value.length < 8) {
      isPasswordValidate(false);
    } else {
      isPasswordValidate(true);
    }
  }

  Rx<ApiResponse<LoginModel>> postResponse =
      ApiResponse<LoginModel>.loading().obs;



  void sendDataFromApi(LoginModel baseModel) async {
    // _setData(ApiResponse.loading());

    try {
      final data = await _api.postData(baseModel);
      print(data);
      _setPostData(ApiResponse.completed(data));
    } on SocketException {
      _setPostData(ApiResponse.error('No Internet Connection'));
    } on BadRequestException {
      _setPostData(ApiResponse.error('Bad request'));
    } on UnauthorisedException {
      _setPostData(ApiResponse.error('Unauthorized'));
    } on FetchDataException {
      _setPostData(ApiResponse.error(
          'An error occurred while communicating with the server'));
    } catch (e) {
      _setPostData(
          ApiResponse.error('An unknown error occurred: ${e.toString()}'));
    }
  }

  

  void _setPostData(ApiResponse<LoginModel> response) {
    postResponse.value = response;
  }
}
