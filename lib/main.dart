import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/routing/app_router.dart';
import 'package:demo_app/routing/routing_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter demo',
        theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: colorPrimarySeed,
            primary: colorPrimarySeed,
            secondary: colorSecondarySeed,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        initialRoute: initialScreen,
        onGenerateRoute: generateRoutes,
        // routes: <String, Widget Function(BuildContext)>{
        //   ContactDetailsScreen.routeName: (BuildContext context) =>
        //       const ContactDetailsScreen(),
        // },
      ),
    );
  }
}
