import 'package:flutter/material.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
        // shape: RoundedRectangleBorder(borderRadius: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),

        // /// * `shape` - RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
      ),
      child: Text(title, style: TextStyle(color: AppColors.white)),
    );
  }
}
