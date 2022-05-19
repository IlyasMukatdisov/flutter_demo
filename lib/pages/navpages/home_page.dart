import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /*double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;*/

    return Scaffold(
      body: Column(
        children: [
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
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
            child: const AppLargeText(
              text: "Discover",
            ),
          ),
          /*Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: TabBar(
              tabs: [TabBar],
            )
          )*/
        ],
      ),
    );
  }
}
