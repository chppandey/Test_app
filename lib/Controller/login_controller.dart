// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:demo_app/remote/api/api_provider.dart';
import 'package:demo_app/routing/routing_config.dart';
import 'package:demo_app/utils/local_store.dart';
import 'package:demo_app/utils/toast_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  ApiProvider apiProvider = ApiProvider();

  var emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  RxBool isUserNameValid = false.obs;
  RxBool isPasswordValidate = false.obs;
  RxBool isPasswordVisible = true.obs;
  RxBool isLoading = false.obs;

  togglePassword() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  clearController() {
    emailController.value.clear();
    passwordController.value.clear();
    isPasswordVisible.value = true;
  }

  // RxBool isEmail(String input) => EmailValidator.validate(input).obs;
  setUserValidate(String input) {
    if (input.length > 4) {
      isUserNameValid(true);
    } else {
      isUserNameValid(false);
    }
  }

  setPasswordValidate(String value) {
    if (value.length < 5) {
      isPasswordValidate(false);
    } else {
      isPasswordValidate(true);
    }
  }

  Future<void> userLogin(BuildContext context) async {
    Map<String, dynamic> reqModel = {
      "identity": emailController.value.text.trim(),
      "password": passwordController.value.text.trim(),
    };

    if (kDebugMode) {
      print(reqModel);
    }
    try {
      isLoading(true);
      final mData = await apiProvider.loginApiCall(reqModel);

      if (mData.status == 200) {
        print("user token-->${mData.token}");
        SharedPref().setUserToken(userToken: mData.token ?? "");
        ToastWidget.successToast(
            success: mData.message ?? "Something went wrong");

        Navigator.pushNamedAndRemoveUntil(
          context,
          baseScreen,
          (Route<dynamic> route) => false,
        );

        isLoading(false);
      } else {
        ToastWidget.errorToast(error: mData.message ?? "Something went wrong");
        isLoading(false);
      }
    } catch (e) {
      if (kDebugMode) {
        log(e.toString());
      }

      ToastWidget.errorToast(error: e.toString());
      isLoading(false);
    }
  }
}
