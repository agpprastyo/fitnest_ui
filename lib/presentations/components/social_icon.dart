import 'package:flutter/material.dart';

import '../../core/styles/colors.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: AppColors.gray2, width: 0.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        icon: Image.asset(
          imagePath,
          width: 20,
          height: 25,
        ));
  }
}
