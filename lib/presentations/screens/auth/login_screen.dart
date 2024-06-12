import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../core/routes/routes.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../components/main_button.dart';
import '../../components/main_text_form_field.dart';
import '../../components/social_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  bool isCheck = false;

  Key formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Wrap(
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 5,
              children: [
                const SizedBox(height: 24),
                Text('Hey there',
                    style: const AppTextStyles().textLargeTextRegular),
                Text('Welcome Back', style: const AppTextStyles().titleH4Bold),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 15,
                        children: [
                          MainTextFormField(
                            prefixIcon: IconlyLight.message,
                            nameController: emailController,
                            nameFocusNode: emailFocusNode,
                            hintText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                          ),
                          MainTextFormField(
                            isPassword: true,
                            prefixIcon: IconlyLight.lock,
                            nameController: passwordController,
                            nameFocusNode: passwordFocusNode,
                            hintText: 'Password',
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: const AppTextStyles()
                                .linkMedium
                                .copyWith(fontSize: 14, color: AppColors.gray1),
                          ))
                    ],
                  )),
            ])),
          ),
          SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MainButton(
                      padding: EdgeInsets.zero,
                      type: ButtonType.gradient,
                      onPressed: () {
                        context.goNamed(RoutesName.successAuth.name);
                      },
                      child: Wrap(
                        spacing: 10,
                        children: [
                          const Icon(
                            IconlyBold.login,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            'Login',
                            style: const AppTextStyles()
                                .textLargeTextBold
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Flexible(flex: 2, child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'Or',
                            style: const AppTextStyles().textLargeTextRegular,
                          ),
                        ),
                        const Flexible(flex: 2, child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialIcon(imagePath: 'assets/icons/facebook.png'),
                        SizedBox(width: 30),
                        SocialIcon(imagePath: 'assets/icons/google.png'),
                      ],
                    ),
                    const SizedBox(height: 30),
                    RichText(
                      text: TextSpan(
                        text: 'Don’t have an account yet? ',
                        style: const AppTextStyles()
                            .textMediumTextRegular
                            .copyWith(color: AppColors.blackColor),
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: const AppTextStyles()
                                .textMediumTextRegular
                                .copyWith(
                                  color: AppColors.purple1,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.goNamed(RoutesName.register.name);
                              },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              )),
        ],
      )),
    );
  }
}
