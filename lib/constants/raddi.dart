import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Radii {
  static BorderRadius borderRadius50px = BorderRadius.circular(50.r);
  static BorderRadius borderRadius60px = BorderRadius.circular(60.r);
  static BorderRadius borderRadius34pxTop = BorderRadius.only(
      topLeft: Radius.circular(34.r), topRight: Radius.circular(34.r));
  static BorderRadius borderRadius16pxTop = BorderRadius.only(
      topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r));
  static BorderRadius cardBorderRadius = BorderRadius.circular(10.r);
  static BorderRadius borderRadius5px = BorderRadius.circular(5.r);
  static BorderRadius borderRadius2px = BorderRadius.circular(2.r);
  static BorderRadius borderRadius4px = BorderRadius.circular(4.r);
  static BorderRadius borderRadiusLeft50px = BorderRadius.only(
      topLeft: Radius.circular(50.r), bottomLeft: Radius.circular(50.r));
}
