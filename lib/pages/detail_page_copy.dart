import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo/cubit/app_cubit_state.dart';
import 'package:flutter_demo/cubit/app_cubits.dart';

import '../res/colors/colors.dart';
import '../widgets/app_button.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
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
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;

      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "http://mark.bslmeiyu.com/uploads/${detail.place.image}"),
                  fit: BoxFit.cover)),
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
                  children: [
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(Icons.menu),
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
                                text: detail.place.name,
                                size: 24,
                                color: Colors.black.withOpacity(0.77),
                              ),
                              AppLargeText(
                                text: "\$${detail.place.price}",
                                size: 24,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.place,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 5),
                              AppText(
                                text: detail.place.location,
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
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : Colors.grey,
                                  );
                                }),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              AppText(
                                text: "${detail.place.stars.toDouble()}",
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
                          AppText(text: detail.place.description),
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
    });
  }
}
