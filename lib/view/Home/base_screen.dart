import 'package:demo_app/Controller/get_data_view_model.dart';
import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/routing/routing_config.dart';
import 'package:demo_app/utils/local_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final getDataController = Get.put(GetDataController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataController.getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
        actions: [
          IconButton(
              onPressed: () {
                getDataController.getData(context);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Obx(
        () => getDataController.isLoading == true
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  tiles(
                      key: "vesselCnt",
                      value: getDataController.getDataModel.value.vesselCnt
                          .toString()),
                  tiles(
                      key: "boatownrCnt",
                      value: getDataController.getDataModel.value.boatownrCnt
                          .toString()),
                  tiles(
                      key: "alertCnt",
                      value: getDataController.getDataModel.value.alertCnt
                          .toString()),
                  tiles(
                      key: "userCnt",
                      value: getDataController.getDataModel.value.userCnt
                          .toString()),
                  tiles(
                      key: "crewCnt",
                      value: getDataController.getDataModel.value.crewCnt
                          .toString()),
                  tiles(
                      key: "geoboundaryAlertCnt",
                      value: getDataController
                          .getDataModel.value.geoboundaryAlertCnt
                          .toString()),
                  tiles(
                      key: "infoAlertCnt",
                      value: getDataController.getDataModel.value.infoAlertCnt
                          .toString()),
                  Card(
                    margin: const EdgeInsets.all(20),
                    child: ListTile(
                      onTap: () async{
                      await   SharedPref().deleteAllData();
                        Navigator.popAndPushNamed(context, signInScreen);
                      },
                      title: const Text(
                        "Log Out",
                        style: TextStyle(color: AppColors.darkRedColor),
                      ),
                      trailing: const Icon(
                        Icons.logout,
                        color: AppColors.darkRedColor,
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }

  Widget tiles({required String key, required String value}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Card(
        child: ListTile(
          title: Text(key),
          trailing: Text(value),
        ),
      ),
    );
  }
}
