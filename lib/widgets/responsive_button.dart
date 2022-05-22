import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  double? width;
  double? height;
  final double borderRadius;
  final String text;
  double? textSize;

  ResponsiveButton(
      {Key? key,
      this.isResponsive = false,
      this.width,
      this.height,
      this.text = "",
      this.textSize = 16,
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
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: textSize),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: textSize),
            Icon(Icons.arrow_forward_ios, color: Colors.white, size: textSize),
            SizedBox(
              width: isResponsive == true ? 10 : 0,
              height: height,
            ),
            isResponsive
                ? AppText(
                    size: textSize!,
                    text: text,
                    color: Colors.white,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
