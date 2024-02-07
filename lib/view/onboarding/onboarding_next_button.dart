import 'package:demo_app/routing/routing_config.dart';
import 'package:flutter/material.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton(
    this.pageController, {
    Key? key,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    int currentSlideNo = 1;
    return ElevatedButton(
      onPressed: () {
        debugPrint(currentSlideNo.toString());
        int updatedPageNo = currentSlideNo == 2 ? 2 : currentSlideNo + 1;
        currentSlideNo++;
        if (currentSlideNo == 3) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            signInScreen,
            (Route<dynamic> route) => false,
          );
        }
        pageController.animateToPage(
          updatedPageNo,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      style: ElevatedButton.styleFrom(
        foregroundColor:
            currentSlideNo == 2 ? Colors.white : const Color(0xff747474),
        backgroundColor:
            currentSlideNo == 2 ? const Color(0xffFFB93E) : Colors.white,
        minimumSize: const Size(
          double.infinity,
          55.0,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        elevation: 0.0,
        textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontSize: 15.0,
            ),
      ),
      child:
          currentSlideNo == 2 ? const Text('GET STARTED') : const Text('NEXT'),
    );
  }
}
