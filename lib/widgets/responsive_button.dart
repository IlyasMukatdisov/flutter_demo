import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/widgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final double height;
  final double borderRadius;
  final String text;

  const ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width = 100,
      this.height = 50,
      this.text = "",
      this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isResponsive){
      return Container(
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
            width: 10,
            height: height,
          ),
          AppText(
            size: 16,
            text: text,
            color: Colors.white,
          )
          ],
        ),
      );
    }
    else {
      return Container(
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
            /*SizedBox(
            width: 10,
            height: height,
          ),
          AppText(
            size: 16,
            text: text,
            color: Colors.white,
          )*/
          ],
        ),
      );
    }
  }
}
