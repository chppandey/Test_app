import 'package:demo_app/utils/device_size_config.dart';
import 'package:flutter/material.dart';


class OnboardingSlide extends StatelessWidget {
  const OnboardingSlide({
    Key? key,
    required this.deviceSizeConfig,
    required this.imageUrl,
    required this.headingText,
    required this.subheadingText,
    required TextStyle style,
    required TextAlign textAlign,
  }) : super(key: key);

  final DeviceSizeConfig deviceSizeConfig;
  final String imageUrl;
  final String headingText;
  final String subheadingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 50.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Center(
              child: Image.asset(
                imageUrl,
                height: deviceSizeConfig.blockSizeVertical * 45,
              ),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Text(
            headingText,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: 30.0,
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            subheadingText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
