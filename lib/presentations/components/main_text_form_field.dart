import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../core/styles/colors.dart';

// ignore: must_be_immutable
class MainTextFormField extends StatefulWidget {
  MainTextFormField({
    super.key,
    required this.nameController,
    required this.nameFocusNode,
    this.validator,
    required this.hintText,
    this.keyboardType = TextInputType.name,
    this.textInputAction = TextInputAction.next,
    this.prefixIcon = IconlyLight.profile,
    this.isPassword = false,
    this.suffixIcon,
    this.enable = true,
    this.onTap,
  });

  final TextEditingController nameController;
  final FocusNode nameFocusNode;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final IconData prefixIcon;

  bool isPassword;

  final Widget? suffixIcon;

  bool enable;

  void Function()? onTap;

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.onTap != null,
      onTap: widget.onTap,
      enabled: widget.enable,
      validator: widget.validator,
      onChanged: (value) {
        setState(() {
          widget.nameController.text = value;
        });
      },
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      obscureText: widget.isPassword ? isObscure : false,
      obscuringCharacter: '*',
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      controller: widget.nameController,
      focusNode: widget.nameFocusNode,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon),
        prefixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? AppColors.blue1
              : AppColors.blackColor.withOpacity(0.5),
        ),
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility : Icons.visibility_off),
                  )
                : null),
        suffixIconColor: WidgetStateColor.resolveWith(
          (states) => states.contains(WidgetState.focused)
              ? AppColors.blue1
              : AppColors.blackColor.withOpacity(0.5),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blue1, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.danger, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        fillColor: AppColors.borderColor,
      ),
    );
  }
}
