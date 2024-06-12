import 'package:fitnest_ui/core/routes/routes.dart';
import 'package:fitnest_ui/core/styles/colors.dart';
import 'package:fitnest_ui/core/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 40, 30, 0),
            sliver: SliverAppBar(
              leadingWidth: 0,
              clipBehavior: Clip.none,
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Back,',
                      style: const AppTextStyles()
                          .textSmallTextRegular
                          .copyWith(color: AppColors.gray2)),
                  Text('Stefani Wong',
                      style: const AppTextStyles().titleH4Bold),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.goNamed(RoutesName.notification.name);
                  },
                  icon: const Badge(
                    largeSize: 20,
                    smallSize: 10,
                    child: Icon(
                      IconlyLight.notification,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Stack(
                children: [
                  Image.asset(
                    width: double.infinity,
                    'assets/images/Banner.png',
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 50, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('BMI (Body Mass Index)',
                              style: const AppTextStyles()
                                  .textMediumTextSemibold
                                  .copyWith(color: AppColors.whiteColor)),
                          const SizedBox(height: 10),
                          Text('You have a normal weight',
                              style: const AppTextStyles()
                                  .textSmallTextRegular
                                  .copyWith(color: AppColors.whiteColor)),
                          const SizedBox(height: 16),
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              gradient: AppColors.purpleLinear,
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'View More',
                                  style: const AppTextStyles()
                                      .textCaptionSemibold
                                      .copyWith(color: AppColors.whiteColor),
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 50, 0),
                      child: Text('Chart'),
                    ),
                  )
                ],
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 75,
                  decoration: BoxDecoration(
                      color: AppColors.blueLinear.colors[1].withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today Target',
                        style: AppTextStyles().textMediumTextSemibold,
                      ),
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          gradient: AppColors.blueLinear,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FilledButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5)),
                          onPressed: () {},
                          child: Text(
                            'Check',
                            style: const AppTextStyles()
                                .textSmallTextRegular
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ))
            ])),
          )
        ],
      ),
    );
  }
}
