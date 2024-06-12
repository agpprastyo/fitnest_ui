import 'package:fitnest_ui/core/styles/colors.dart';
import 'package:fitnest_ui/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/routes.dart';
import '../../components/main_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.blueLinear,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                text: 'FitNest',
                style: const AppTextStyles().titleH2Bold.copyWith(
                      color: AppColors.blackColor,
                    ),
                children: [
                  TextSpan(
                    text: 'X',
                    style: const AppTextStyles().titleH1Bold.copyWith(
                          fontSize: 34,
                          color: AppColors.whiteColor,
                        ),
                  ),
                ],
              )),
              Text(
                'Everybody Can Train',
                style: const AppTextStyles()
                    .textSubtitleRegular
                    .copyWith(color: AppColors.gray1),
              )
            ],
          ),
        ),
        bottomNavigationBar: MainButton(
          type: ButtonType.plain,
          title: 'Get Started',
          onPressed: () {
            context.pushReplacementNamed(RoutesName.introduction.name);
          },
        ),
      ),
    );
  }
}
