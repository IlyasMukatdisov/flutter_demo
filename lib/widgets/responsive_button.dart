import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/widgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  double? width;
  double? height;
  final double borderRadius;
  final String text;

  ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width,
      this.height,
      this.text = "",
      this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: AppColors.mainColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "img/button-one.svg",
              width: 60,
              height: 25,
              alignment: Alignment.center,
              color: Colors.white,
            ),
            SizedBox(
              width: isResponsive == false ? 0 : 10,
              height: height,
            ),
            AppText(
              size: 16,
              text: text,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
