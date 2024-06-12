import 'package:flutter/material.dart';

import '../../core/styles/colors.dart';
import '../../core/styles/text_styles.dart';

enum ButtonType { plain, gradient }

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton({
    super.key,
    this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
    this.type = ButtonType.plain,
    this.title = 'Register',
    this.child,
  });

  final void Function()? onPressed;
  final String? title;
  final EdgeInsetsGeometry padding;
  final ButtonType type;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: type == ButtonType.plain
                  ? Colors.transparent
                  : AppColors.blue2.withOpacity(0.5),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(99),
          gradient: type == ButtonType.gradient ? AppColors.blueLinear : null,
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: type == ButtonType.plain
                  ? AppColors.whiteColor
                  : Colors.transparent,
              shadowColor: Colors.transparent),
          child: child ??
              Text(
                title!,
                style: const AppTextStyles().textLargeTextBold.copyWith(
                      color: type == ButtonType.plain
                          ? AppColors.blue1
                          : AppColors.whiteColor,
                    ),
              ),
        ),
      ),
    );
  }
}
