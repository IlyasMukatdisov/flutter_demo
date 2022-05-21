import 'package:flutter/material.dart';
import 'package:flutter_demo/res/colors/colors.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';
import 'package:flutter_demo/widgets/app_text.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "ballooning.svg": "Ballooning",
    "hiking.svg": "Hiking",
    "kayaking.svg": "Kayaking",
    "snorkeling.svg": "Snorkeling"
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
   /* double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;*/

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //top bar
            Container(
              padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black26),
                    child:
                        const Icon(Icons.person, size: 50, color: Colors.white),
                  )
                ],
              ),
            ),
            //Header
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    AppLargeText(
                      text: "Discover",
                    ),
                  ],
                )),
            //Tab Bar
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    controller: tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    indicator: const CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: const [
                      Tab(text: "Places"),
                      Tab(text: "Inspiration"),
                      Tab(text: "Emotions")
                    ],
                  ),
                )),
            //TabBarView
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                                image: AssetImage("img/mountain.webp"),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                  const Text("There"),
                  const Text("Buy"),
                ],
              ),
            ),
            //Explore More
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppLargeText(
                    text: "Explore More",
                    size: 16,
                    color: Colors.black87,
                  ),
                  AppText(
                    text: "See all",
                    size: 14,
                  )
                ],
              ),
            ),
            //ListView
            Container(
              height: 120,
              width: double.maxFinite,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              /*image: DecorationImage(
                                    image: AssetImage("img/${images.keys.elementAt(index)}"),
                                    fit: BoxFit.cover)*/
                            ),
                            child: SvgPicture.asset(
                              "img/${images.keys.elementAt(index)}",
                              fit: BoxFit.cover,
                              color: AppColors.mainColor,
                            ),
                          ),
                          AppText(text: images.values.elementAt(index))
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  final double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
