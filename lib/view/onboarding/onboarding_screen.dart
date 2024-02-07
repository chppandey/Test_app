import 'package:demo_app/constants/app_colors.dart';
import 'package:demo_app/routing/routing_config.dart';
import 'package:demo_app/view/onboarding/onboarding_next_button.dart';
import 'package:demo_app/view/onboarding/onboarding_slide.dart';
import 'package:demo_app/utils/device_size_config.dart';
import 'package:demo_app/utils/local_store.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    setIsSeen(true);
    // TODO: implement initState
    super.initState();
  }

  void setIsSeen(bool isSeen) async {
    await SharedPref().setOnBoaringScreen(isSeen: isSeen);
  }

  @override
  Widget build(BuildContext context) {
    int currentSlideNo = 0;
    DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    final PageController pageController = PageController(
      initialPage: currentSlideNo,
    );
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              colorBackgroundGradientStart,
              colorBackgroundGradientEnd,
            ],
            tileMode: TileMode.mirror,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (int value) {
                  
                  },
                  children: <Widget>[
                    OnboardingSlide(
                      deviceSizeConfig: deviceSizeConfig,
                      imageUrl: 'assets/images/onboarding_graphic_01.png',
                      headingText: '1000+ Exciting Gifts',
                      subheadingText:
                          'Explore Cakes, Flowers, Plants, Personalized Gifts, Accessories & More...',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    OnboardingSlide(
                      deviceSizeConfig: deviceSizeConfig,
                      imageUrl: 'assets/images/onboarding_graphic_02.png',
                      headingText: 'Fabulous Gifts For All',
                      subheadingText:
                          'Explore Cakes, Flowers, Plants, Personalized Gifts, Accessories & More...',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    OnboardingSlide(
                      deviceSizeConfig: deviceSizeConfig,
                      imageUrl: 'assets/images/question_2.png',
                      headingText: 'Let Get Started',
                      subheadingText:
                          'Explore Cakes, Flowers, Plants, Personalized Gifts, Accessories & More...',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  right: 24.0,
                  top: 0.0,
                  bottom: 5.0,
                ),
                width: double.infinity,
                height: deviceSizeConfig.blockSizeVertical * 15,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    OnboardingNextButton(pageController),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentSlideNo = 3;
                        });
                        // settingsBox.put('returningUser', true);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          baseScreen,
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: colorPrimarySeed,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
