import 'package:fitnest_ui/core/routes/routes.dart';
import 'package:fitnest_ui/core/styles/colors.dart';
import 'package:fitnest_ui/core/styles/text_styles.dart';
import 'package:fitnest_ui/presentations/components/main_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../components/main_text_form_field.dart';
import '../../components/social_icon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();

  TextEditingController lastNameController = TextEditingController();
  FocusNode lastNameFocusNode = FocusNode();

  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  bool isCheck = false;

  Key registerFormKey = GlobalKey<FormState>();

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
                  Text('Create an Account',
                      style: const AppTextStyles().titleH4Bold),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Form(
                    key: registerFormKey,
                    child: Column(
                      children: [
                        Wrap(
                          runSpacing: 15,
                          children: [
                            MainTextFormField(
                              nameController: firstNameController,
                              nameFocusNode: firstNameFocusNode,
                              hintText: 'First Name',
                            ),
                            MainTextFormField(
                              nameController: lastNameController,
                              nameFocusNode: lastNameFocusNode,
                              hintText: 'Last Name',
                            ),
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
                              textInputAction: TextInputAction.done,
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        CheckboxListTile(
                          value: isCheck,
                          visualDensity: VisualDensity.comfortable,
                          contentPadding: EdgeInsets.zero,
                          splashRadius: 0,
                          controlAffinity: ListTileControlAffinity.leading,
                          title: Transform.translate(
                            offset: const Offset(-10, 0),
                            child: RichText(
                              text: TextSpan(
                                text: 'I agree to the ',
                                style: const AppTextStyles()
                                    .textCaptionRegular
                                    .copyWith(
                                        color: AppColors.gray1, fontSize: 12),
                                children: [
                                  TextSpan(
                                    text: 'Terms of Service',
                                    style: const AppTextStyles()
                                        .textCaptionRegular
                                        .copyWith(
                                            color: AppColors.gray1,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                    style: const AppTextStyles()
                                        .textCaptionRegular
                                        .copyWith(
                                            color: AppColors.gray1,
                                            fontSize: 12),
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: const AppTextStyles()
                                        .textCaptionRegular
                                        .copyWith(
                                            color: AppColors.gray1,
                                            fontSize: 12,
                                            decoration:
                                                TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              isCheck = value!;
                            });
                          },
                        )
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
                        title: 'Register',
                        type: ButtonType.gradient,
                        onPressed: () {
                          context.goNamed(RoutesName.completeProfile.name);
                        },
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
                          text: 'Already have an account? ',
                          style: const AppTextStyles()
                              .textMediumTextRegular
                              .copyWith(color: AppColors.blackColor),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: const AppTextStyles()
                                  .textMediumTextRegular
                                  .copyWith(
                                    color: AppColors.purple1,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.goNamed(RoutesName.login.name);
                                },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
