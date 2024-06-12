import 'package:fitnest_ui/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../core/routes/routes.dart';
import '../../../core/styles/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              clipBehavior: Clip.none,
              centerTitle: true,
              title: Text('Notification',
                  style: const AppTextStyles().textLargeTextBold),
              automaticallyImplyLeading: true,
              leading: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: const Color(0xffF7F8F8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  context.canPop()
                      ? context.pop()
                      : context.goNamed(RoutesName.home.name);
                },
                icon: const Icon(IconlyLight.arrow_left_2),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconlyLight.more_square,
                    size: 30,
                  ),
                )
              ],
            ),
            SliverPadding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                sliver: SliverLayoutBuilder(
                  builder:
                      (BuildContext context, SliverConstraints constraints) {
                    return SliverList(
                      delegate: SliverChildListDelegate([
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconlyLight.notification,
                              size: 100,
                              color: AppColors.gray2,
                            ),
                            Text(
                              'No Notification',
                              style: TextStyle(
                                color: AppColors.gray2,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    );
                  },
                )),
          ],
        ),
      ),
    );
  }
}
