import 'package:fitnest_ui/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../core/styles/text_styles.dart';
import '../../components/main_button.dart';

class GoalScreen extends StatelessWidget {
  const GoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Text('What is your goal ?',
                        style: const AppTextStyles().titleH4Bold),
                    const SizedBox(height: 8),
                    Text(
                      'It will help us to choose a best\nprogram for you',
                      textAlign: TextAlign.center,
                      style: const AppTextStyles().textMediumTextRegular,
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
                child: PageView(
              onPageChanged: (index) {
                print(index);
              },
              controller: PageController(
                viewportFraction: 0.8,
              ),
              children: [
                CarouselItem(),
                CarouselItem(),
                CarouselItem(),
              ],
            ))
          ],
        )),
        bottomNavigationBar: MainButton(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          type: ButtonType.gradient,
          title: 'Go To Home',
          onPressed: () {
            // GoRouter.of(context).goNamed(Routes.home);
          },
        ));
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: AppColors.blueLinear,
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 22,
              offset: const Offset(0, 10),
            )
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(35, 35, 35, 0),
            constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.65),
            child: Image.asset(
              'assets/images/goals-carousel/goal1.png',
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 26),
          Text(
            'Improve Shape',
            style: AppTextStyles()
                .textMediumTextSemibold
                .copyWith(color: AppColors.whiteColor, fontSize: 16),
          ),
          SizedBox(height: 6),
          SizedBox(
            width: 75,
            child: Divider(height: 3, color: AppColors.whiteColor),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'I have a low amount of body fat and need / want to build more muscle',
              textAlign: TextAlign.center,
              style: AppTextStyles()
                  .textSmallTextRegular
                  .copyWith(color: AppColors.whiteColor),
            ),
          )
        ],
      ),
    );
  }
}
