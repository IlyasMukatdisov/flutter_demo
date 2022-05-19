import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final double? height;
  final double borderRadius;
  final String? text;

  const ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width,
      this.height,
      this.text = "",
      this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: AppColors.mainColor),
      child: Row(
        children: [Image.asset("img/button-one.webp")],
      ),
    );
  }
}
