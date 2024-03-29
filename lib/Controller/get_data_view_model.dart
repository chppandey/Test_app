import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/model/get_data_model.dart';
import 'package:demo_app/remote/api/api_provider.dart';
import 'package:demo_app/utils/toast_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDataController extends GetxController {
  RxBool isLoading = false.obs;
  ApiProvider apiProvider = ApiProvider();
  Rx<GetDataModel> getDataModel = GetDataModel().obs;

  getData(BuildContext context) async {
    try {
      isLoading(true);
      final mData = await apiProvider.getData();
      print("getdata calling $mData");
      if (mData.status.toString().contains('200')) {
        Get.snackbar("Success", "got data",
            backgroundColor: greenColor, colorText: whiteColor);
        getDataModel.value = mData;

        // ignore: use_build_context_synchronously

        isLoading(false);
      } else {
        ToastWidget.errorToast(error: mData.message ?? "Something went wrong");
        isLoading(false);
      }
    } catch (e) {
      if (e is DioError) {
        Get.snackbar("Error", e.error.toString());
      } else {
        // Handle other types of exceptions
      }
      Get.snackbar("Error", e.toString());
      isLoading(false);
    }
  }
}
