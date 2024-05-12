import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_elevated_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static Widget builder(BuildContext context) {
    return OnboardingScreen();
  }

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isOptionChoose = false;
  PageController _pageController = PageController();
  bool _isDisabled = false;

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if (_pageController.page == 2) {
        setState(() {
          _isDisabled = true;
        });
      } else {
        setState(() {
          _isDisabled = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: appTheme.,
      body: Column(
       // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Container(
              child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: 2,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: 4.0,
                    dotWidth: 180.h,
                    dotHeight: 4.0,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: theme.colorScheme.primary.withAlpha(50),
                    activeDotColor: theme.colorScheme.primary,
                 //   type: SlideType.slideUnder,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            ),
          ),
          Expanded(
            child: Container(
              margin:  const EdgeInsets.only(bottom: 60.0),
              child: PageView.custom(
                // physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                childrenDelegate: SliverChildListDelegate(
                  [
                    firstScreen(context),
                    secondScreen(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomElevatedButton(
        text: 'Continue',
        buttonStyle: ElevatedButton.styleFrom(
          disabledBackgroundColor:
              theme.colorScheme.primary.withOpacity(.3), // Background Color
          disabledForegroundColor:
              theme.colorScheme.onPrimaryContainer.withOpacity(.3), //Text Color
        ),
        margin: EdgeInsets.only(
          left: 16.h,
          right: 16.h,
        ),
        onPressed: () {
          if (_pageController.page == 1) {
            NavigatorService.pushNamedAndRemoveUntil(
                AppRoutes.navigationBarScreen);
          } else {
            _pageController.nextPage(
                duration: Duration(milliseconds: 100), curve: Curves.linear);
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget firstScreen(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomImageView(
            height: 300.adaptSize,
            imagePath: ImageConstant.imgOnboarding1,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 50.v,
          ),
          Text(
            'Welcome to\nour app!',
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.v,
          ),
          Text(
            'We will help you analyze your gaming activity in card games',
            style: CustomTextStyles.titleLargeBlack900,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Widget secondScreen(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomImageView(
            height: 300.adaptSize,
            imagePath: ImageConstant.imgOnboarding2,
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            height: 50.v,
          ),
          Text(
            'Make your game more\nsuccessful',
            style: theme.textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16.v,
          ),
          Text(
            'We will help you better understand your gaming strategy ',
            style: CustomTextStyles.titleLargeBlack900,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  customBoxDecoration(isActive) {
    return BoxDecoration(
      color: isActive ? appTheme.black900 : appTheme.blueGray400,
      border: isActive
          ? Border.all(color: theme.colorScheme.primary)
          : Border.all(color: appTheme.blueGray400),
      borderRadius: const BorderRadius.all(
        Radius.circular(8.0),
      ),
    );
  }
}
