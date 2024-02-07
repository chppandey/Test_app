import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator.adaptive(),
            SizedBox(
              width: 10.w,
            ),
            const SizedBox(height: 16.0),
            const Text("Uploading data..."),
          ],
        ),
      );
    },
  );
}

void hideProgressDialog(BuildContext context) {
  Navigator.of(context).pop(); // Close the dialog
}
