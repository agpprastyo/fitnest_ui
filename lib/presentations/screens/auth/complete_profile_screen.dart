import 'package:fitnest_ui/presentations/components/main_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import '../../../core/routes/routes.dart';
import '../../../core/styles/colors.dart';
import '../../../core/styles/text_styles.dart';
import '../../components/main_button.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController genderController = TextEditingController();
  FocusNode genderFocusNode = FocusNode();
  FocusNode dummyFocusNode = FocusNode();
  String selectedGender = 'Choose Gender';

  TextEditingController dateOfBirthController = TextEditingController();
  FocusNode dateOfBirthFocusNode = FocusNode();
  String selectedDateOfBirth = 'Choose Date of Birth';

  TextEditingController weightController = TextEditingController();
  FocusNode weightFocusNode = FocusNode();
  String selectedWeight = 'Choose Weight';

  TextEditingController heightController = TextEditingController();
  FocusNode heightFocusNode = FocusNode();
  String selectedHeight = 'Choose Height';

  void showGenderDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Select Gender'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Male'),
                    onTap: () {
                      setState(() {
                        genderController.text = 'Male';
                        selectedGender = 'Male';
                        print('selected gender: $selectedGender');
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Female'),
                    onTap: () {
                      setState(() {
                        genderController.text = 'Female';
                        selectedGender = 'Female';
                        print('selected gender: $selectedGender');
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void showDateDialog() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        dateOfBirthController.text = value.toString().substring(0, 10);
        selectedDateOfBirth = value.toString().substring(0, 10);
        print('selected date of birth: $selectedDateOfBirth');
      }
    });
  }

  @override
  void initState() {
    genderFocusNode.addListener(() {
      if (genderFocusNode.hasFocus) {
        FocusScope.of(context).requestFocus(dummyFocusNode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    genderController.dispose();
    genderFocusNode.dispose();
    dummyFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Image.asset(
                      'assets/images/complete-profile.png',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text('Let’s complete your profile',
                      style: const AppTextStyles().titleH4Bold),
                  const SizedBox(height: 5),
                  Text(
                    'It will help us to know more about you!',
                    textAlign: TextAlign.center,
                    style: const AppTextStyles().textLargeTextRegular,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                MainTextFormField(
                  nameController: genderController,
                  nameFocusNode: genderFocusNode,
                  hintText: selectedGender,
                  prefixIcon: IconlyLight.user,
                  suffixIcon: const Icon(IconlyLight.arrow_down_2),
                  onTap: showGenderDialog,
                ),
                const SizedBox(height: 16),
                MainTextFormField(
                  nameController: dateOfBirthController,
                  nameFocusNode: dateOfBirthFocusNode,
                  hintText: selectedDateOfBirth,
                  prefixIcon: IconlyLight.calendar,
                  onTap: showDateDialog,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: MainTextFormField(
                        keyboardType: TextInputType.number,
                        nameController: weightController,
                        nameFocusNode: weightFocusNode,
                        hintText: selectedWeight,
                        prefixIcon: IconlyLight.document,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.caloriesLinear,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text('KG',
                                style: const AppTextStyles()
                                    .textMediumTextBold
                                    .copyWith(
                                      color: Colors.white,
                                    )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: MainTextFormField(
                        keyboardType: TextInputType.number,
                        nameController: heightController,
                        nameFocusNode: heightFocusNode,
                        hintText: selectedHeight,
                        prefixIcon: IconlyLight.document,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Flexible(
                      flex: 1,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: AppColors.caloriesLinear,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Text('CM',
                                style: const AppTextStyles()
                                    .textMediumTextBold
                                    .copyWith(
                                      color: Colors.white,
                                    )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: MainButton(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        type: ButtonType.gradient,
        title: 'Next',
        onPressed: () {
          context.pushReplacementNamed(RoutesName.goals.name);
        },
      ),
    );
  }
}
