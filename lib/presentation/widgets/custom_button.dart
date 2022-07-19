import 'package:flutter/material.dart';
import 'package:notes_app/config/themes/app_color.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final double size;
  final double iconSize;
  final void Function() onPressed;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      this.icon,
      this.size = 50,
      this.iconSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: AppColor.black),
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
      ),
      onTap: () {
        onPressed();
      },
    );
  }
}
