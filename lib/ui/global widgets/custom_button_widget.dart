import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/utils/check_device_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButtonWidget extends StatelessWidget {
  bool? isLoading;
  String? buttonName;
  VoidCallback? onPress;
  Color? buttonNameColor, buttonColor;
  TextStyle? buttonTextStyle;

  CustomButtonWidget(
      {super.key,
      this.isLoading,
      this.buttonName,
      this.onPress,
      this.buttonColor,
      this.buttonNameColor,
      this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        elevation: 0.0,
        foregroundColor: buttonNameColor ?? whiteColor,
        backgroundColor: buttonColor,
        minimumSize: Size(double.infinity, isMobile(context) ? 55.0 : 45.h),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
        ),
        textStyle: const TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: isLoading!
          ? Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            )
          : Text(
              buttonName ?? "",
              style: buttonTextStyle,
            ),
    );
  }
}
