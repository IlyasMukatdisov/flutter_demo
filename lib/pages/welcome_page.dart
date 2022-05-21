import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/res/strings/strings.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';
import 'package:flutter_demo/widgets/app_text.dart';
import 'package:flutter_demo/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome-one.webp", "welcome-two.webp", "welcome-three.webp"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('img/${images[index]}'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(top: height / 15, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppLargeText(
                            text: Strings.welcomePageFirstHeader, size: 40),
                        const AppText(
                            text: Strings.welcomePageFirstSubHeader, size: 25),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: width / 1.8,
                            child: const AppText(
                              text: Strings.welcomePageFirstText,
                              color: AppColors.textColor2,
                              size: 16,
                            )),
                        const SizedBox(height: 20),
                        Container(
                          constraints: const BoxConstraints.tightFor(),
                          child: ResponsiveButton(
                            height: 50,
                            width: 90,
                            borderRadius: 10, /*text: "Book Trip Now"*/
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          width: 8,
                          margin: const EdgeInsets.only(bottom: 4),
                          height: index == indexDots ? 24 : 8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == indexDots
                                  ? AppColors.mainColor
                                  : AppColors.mainColor.withOpacity(0.5)),
                        );
                      }),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
