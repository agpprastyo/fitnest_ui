import 'package:fitnest_ui/core/routes/routes.dart';
import 'package:fitnest_ui/presentations/components/main_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/styles/text_styles.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset('assets/images/success-auth.png'),
              ),
              const SizedBox(height: 50),
              Text('Welcome, Stefani',
                  style: const AppTextStyles().titleH4Bold),
              const SizedBox(height: 16),
              Text(
                'You are all set now, let’s reach your\ngoals together with us',
                textAlign: TextAlign.center,
                style: const AppTextStyles().textLargeTextRegular,
              ),
            ],
          ),
        ),
        bottomNavigationBar: MainButton(
          type: ButtonType.gradient,
          title: 'Go To Home',
          onPressed: () {
            context.pushNamed(RoutesName.home.name);
          },
        ));
  }
}
