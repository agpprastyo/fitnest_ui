import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/routes/routes.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';

const pageContent = [
  IntroPage(
    title: 'Track Your Goal',
    subtitle:
        'Don\'t worry if you have trouble determining your goals, We can help you determine your goals and track your goals',
    image: 'assets/images/onboarding/onboard1.png',
  ),
  IntroPage(
    title: 'Get Burn',
    subtitle:
        'Let’s keep burning, to achieve yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
    image: 'assets/images/onboarding/onboard2.png',
  ),
  IntroPage(
    title: 'Eat Well',
    subtitle:
        'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
    image: 'assets/images/onboarding/onboard3.png',
  ),
  IntroPage(
    title: 'Improve Sleep \nQuality',
    subtitle:
        'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
    image: 'assets/images/onboarding/onboard4.png',
  )
];

class IntroductionsScreen extends StatefulWidget {
  const IntroductionsScreen({super.key});

  @override
  State<IntroductionsScreen> createState() => _IntroductionsScreenState();
}

class _IntroductionsScreenState extends State<IntroductionsScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  double _pointerValue = 25;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        _pointerValue = (_currentPage + 1) * 25.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          if (_currentPage < 3) {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          } else {
            context.pushReplacementNamed(RoutesName.register.name);
          }
        },
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
                centerX: 0.9,
                centerY: 0.95,
                showLabels: false,
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                minimum: 0,
                maximum: 100,
                radiusFactor: 0.19,
                axisLineStyle: const AxisLineStyle(
                  color: Colors.transparent,
                  thicknessUnit: GaugeSizeUnit.factor,
                  thickness: 0.03,
                ),
                annotations: const <GaugeAnnotation>[
                  GaugeAnnotation(
                    angle: 0,
                    positionFactor: 0,
                    widget: IntroFab(),
                  ),
                ],
                pointers: <GaugePointer>[
                  RangePointer(
                      value: _pointerValue,
                      cornerStyle: CornerStyle.bothCurve,
                      enableAnimation: true,
                      animationDuration: 1200,
                      animationType: AnimationType.ease,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: const Color(0xFF6A6EF6),
                      gradient: const SweepGradient(colors: <Color>[
                        Color(0xff92a3fd),
                        Color(0xff9dceff)
                      ]),
                      width: 0.12),
                ]),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        scrollBehavior: const MaterialScrollBehavior(),
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: pageContent,
      ),
    );
  }
}

class IntroPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const IntroPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          image,
          // height: MediaQuery.sizeOf(context).height * 0.5,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // direction: Axis.vertical,
            // spacing: 10,
            children: [
              Text(
                title,
                style: const AppTextStyles().titleH2Bold.copyWith(
                      color: AppColors.blackColor,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                maxLines: 5,
                style: const AppTextStyles().textMediumTextRegular.copyWith(
                      color: AppColors.gray1,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class IntroFab extends StatelessWidget {
  const IntroFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.blueLinear,
        shape: BoxShape.circle,
      ),
      child: FloatingActionButton(
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        splashColor: Colors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(99),
        ),
        backgroundColor: Colors.transparent,
        onPressed: null,
        child: const Icon(
          IconlyLight.arrow_right_2,
          color: Colors.white,
        ),
      ),
    );
  }
}
