import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';
import 'package:flutter_demo/widgets/app_text.dart';

import '../res/colors/colors.dart';
import '../widgets/app_button.dart';
import '../widgets/responsive_button.dart';

class DetailPageCopy extends StatefulWidget {
  const DetailPageCopy({Key? key}) : super(key: key);

  @override
  State<DetailPageCopy> createState() => _DetailPageCopyState();
}

class _DetailPageCopyState extends State<DetailPageCopy> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/res/img/mountain.webp"), fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              alignment: Alignment.topCenter,
              width: width,
              height: height * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Yosemite",
                              size: 24,
                              color: Colors.black.withOpacity(0.77),
                            ),
                            const AppLargeText(
                              text: "\$250",
                              size: 24,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: const [
                            Icon(
                              Icons.place,
                              color: AppColors.mainColor,
                            ),
                            SizedBox(width: 5),
                            AppText(
                              text: "Usa, California",
                              size: 14,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < gottenStars
                                      ? AppColors.starColor
                                      : Colors.grey,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const AppText(
                              text: "(4.0)",
                              color: AppColors.textColor2,
                              size: 14,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "People",
                          size: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppText(
                            text: "Number of people in your group", size: 16),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Wrap(
                                children: List.generate(5, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedIndex = index;
                                      });
                                    },
                                    child: AppButton(
                                      borderColor: selectedIndex == index
                                          ? Colors.black87
                                          : AppColors.buttonBackground,
                                      backgroundColor: selectedIndex == index
                                          ? Colors.black87
                                          : AppColors.buttonBackground,
                                      size: 60,
                                      text: "${index + 1}",
                                      textColor: selectedIndex == index
                                          ? Colors.white
                                          : AppColors.textColor1,
                                      textSize: 22,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                            text: "Description",
                            size: 24,
                            color: Colors.black.withOpacity(0.8)),
                        const SizedBox(
                          height: 10,
                        ),
                        const AppText(
                            text:
                                "Yosemite National Park is located in central Sierra Nevada in the US State of California. It is located near the wild protected areas. "),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(color: Colors.white),
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: [
                  AppButton(
                    borderColor: AppColors.textColor1,
                    backgroundColor: Colors.white,
                    size: 50,
                    isIcon: true,
                    icon: Icons.favorite_outline,
                    iconColor: AppColors.textColor1,
                  ),
                  ResponsiveButton(
                    height: 50,
                    isResponsive: true,
                    text: "Book Trip now",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
