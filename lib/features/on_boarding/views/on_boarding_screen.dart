import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/core/colors.dart';
import 'package:todo_app/core/common/widgets/.fading_text.dart';
import 'package:todo_app/core/common/widgets/white_space.dart';
import 'package:todo_app/features/on_boarding/views/widgets/first_page.dart';
import 'package:todo_app/features/on_boarding/views/widgets/second_page.dart';

//Onboardig Screen
// Image
// Title
// Subtitle
// Skip // Swipe control

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PageView(
                controller: pageController,
                children: const [FirstPage(), SecondPage()],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      pageController.nextPage(duration: const Duration(milliseconds: 3000), curve: Curves.easeInOut);
                    },
                    child: const Row(
                      children: [
                        //button
                        Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.light,
                        ),
                        WhiteSpace(width: 10),
                        //skip
                        FadingText(
                          text: 'Skip',
                          fontSize: 16,
                          color: AppColors.light,
                          fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                  //swipe indicator
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 2,
                    effect: const WormEffect(
                      dotHeight: 12,
                      spacing: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension on int {
  double adapt() {
    return this * 2;
  }
}
