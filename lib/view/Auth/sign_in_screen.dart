// ignore_for_file: always_specify_types, non_constant_identifier_names

import 'package:demo_app/Controller/login_controller.dart';
import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/constants/styles.dart';
import 'package:demo_app/utils/check_device_size.dart';
import 'package:demo_app/utils/device_size_config.dart';
import 'package:demo_app/view/global%20widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool textIsObscure = true;

  final loginController = Get.put(LoginViewModel());
  final emailKey = GlobalKey<FormState>();
  final passKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, [bool mounted = true]) {
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    final Size mediaQuery = MediaQuery.of(context).size;
    return SingleChildScrollView(deviceSizeConfig, mediaQuery, context);
  }

  Scaffold SingleChildScrollView(DeviceSizeConfig deviceSizeConfig,
      Size mediaQuery, BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: <double>[
              0.25,
              0.65,
              0.75,
            ],
            colors: <Color>[
              colorBackgroundGradientStart,
              colorBackgroundGradientEnd,
              Colors.white,
            ],
            tileMode: TileMode.clamp,
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: SizedBox(
                height: deviceSizeConfig.blockSizeVertical * 40,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/auth_graphic.png',
                  height: deviceSizeConfig.blockSizeVertical * 40,
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 35.0.w, vertical: 15.0.h),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: 0,
                        right: 0.0,
                      ),
                      child: Text(
                        'A Happier World Through Gift-Giving',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isTab(context) ? 30.0 : 20.0,
                          fontWeight: isTab(context)
                              ? FontWeight.w700
                              : FontWeight.w600,
                          color: const Color(0xff1E1E1E),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mediaQuery.height * 0.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Form(
                            key: emailKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Obx(() => TextFormField(
                                  onChanged: (value) {
                                    loginController.setUserValidate(value);
                                  },
                                  controller:
                                      loginController.emailController.value,
                                  validator: (value) {
                                    if (!loginController
                                        .isUserNameValid.value) {
                                      return "Enter valid user id it will min 5 char";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      top: isMobile(context) ? 13.0.h : 14.0.h,
                                      bottom:
                                          isMobile(context) ? 13.0.h : 14.0.h,
                                      left: 20.0,
                                      right: 20.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffAAAAAA),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colorPrimarySeed,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    hintText: 'User id',
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: isMobile(context) ? 10.h : 15.h,
                          ),
                          Form(
                            key: passKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Obx(() => TextFormField(
                                  controller:
                                      loginController.passwordController.value,
                                  obscureText:
                                      loginController.isPasswordVisible.value,
                                  onChanged: (value) {
                                    loginController.setPasswordValidate(value);
                                  },
                                  validator: (value) {
                                    if (value!.length < 8) {
                                      return "Password atleast 8 character";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                        onTap: () {
                                          loginController.togglePassword();
                                        },
                                        child: Icon(
                                          loginController.isPasswordVisible
                                                      .value ==
                                                  false
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: isMobile(context) ? 24 : 30,
                                        )),
                                    contentPadding: EdgeInsets.only(
                                      top: isMobile(context) ? 13.0.h : 14.0.h,
                                      bottom:
                                          isMobile(context) ? 13.0.h : 14.0.h,
                                      left: 20.0,
                                      right: 20.0,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffAAAAAA),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: colorPrimarySeed,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          50.0,
                                        ),
                                      ),
                                    ),
                                    hintText: 'Password',
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 20.0.h,
                          ),
                          Obx(() => CustomButtonWidget(
                              buttonTextStyle: BaseStyles.buttonStyle.copyWith(
                                  color: Colors.grey,
                                  fontSize: isTab(context) ? 10.sp : 10.sp),
                              buttonColor: colorSecondarySeed,
                              buttonName: "SIGN IN",
                              buttonNameColor: whiteColor,
                              onPress: loginController.isUserNameValid.value ==
                                          false ||
                                      loginController
                                              .isPasswordValidate.value ==
                                          false
                                  ? null
                                  : () {
                                      loginController.userLogin(context);
                                    },
                              isLoading: loginController.isLoading.value)),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile(context) ? 14 : 10.sp,
                                  ),
                        ),
                        SizedBox(
                          width: 10.0.h,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'SIGN UP NOW',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      fontSize: isMobile(context) ? 14 : 10.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffFFB93E),
                                    ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
