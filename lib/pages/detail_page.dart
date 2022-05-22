import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/widgets/app_button.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';
import 'package:flutter_demo/widgets/app_text.dart';
import 'package:flutter_demo/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  int personNumber = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("img/mountain.webp"),
                          fit: BoxFit.cover)),
                )),
            Positioned(
                left: 15,
                top: 50,
                right: 15,
                child: Container(
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ))
                    ],
                  ),
                )),
            Positioned(
                top: 320,
                child: Container(
                  width: width,
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
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
                            AppLargeText(
                              text: "\$250",
                              size: 24,
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
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
                        SizedBox(
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
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: "(4.0)",
                              color: AppColors.textColor2,
                              size: 14,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "People",
                          size: 20,
                          color: Colors.black.withOpacity(0.8),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text: "Number of people in your group", size: 16),
                        SizedBox(
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
                        SizedBox(height: 20),
                        AppLargeText(
                            text: "Description",
                            size: 24,
                            color: Colors.black.withOpacity(0.8)),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text:
                                "Yosemite National Park is located in central Sierra Nevada in the US State of California. It is located near the wild protected areas. "),
                      ],
                    ),
                  ),
                )),
            Positioned(
                bottom: 20,
                left: 20,
                right: 20,
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
                ))
          ],
        ),
      ),
    );
  }
}
