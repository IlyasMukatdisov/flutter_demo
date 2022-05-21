import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';

class AppButton extends StatelessWidget {
  Color? iconColor;
  Color? textColor;
  double? textSize;
  final Color borderColor;
  final Color backgroundColor;
  final double size;
  String? text;
  IconData? icon;
  bool? isIcon;

  AppButton(
      {Key? key,
      this.icon,
      this.isIcon = false,
      this.text,
      this.textColor,
      this.textSize,
      required this.borderColor,
      required this.backgroundColor,
      required this.size,
      this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      width: size,
      height: size,
      /*child: AppLargeText(
        text: "${index + 1}",
        color: index < personNumber ? Colors.white : Colors.black87,
        size: 24,
      ),*/
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isIcon == false
          ? AppLargeText(
              text: text!,
              color: textColor!,
              size: textSize!,
            )
          : Icon(icon, color: iconColor),
    );
  }
}
