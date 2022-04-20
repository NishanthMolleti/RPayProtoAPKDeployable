import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:test/buildTransactions.dart';
import 'appbar.dart';
import 'buildIndicator.dart';
import 'buildPage.dart';
import 'buildPayments.dart';
import 'main.dart';
import 'navbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool refresh = true;
  final controller1 = CarouselController();
  final controller2 = CarouselController();
  int activeIndex = 0;
  double topMargin = appbar.preferredSize.height;

  updateBalance() async {
    await getBalance();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: const Navbar(),
      appBar: appbar,
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage("assets/images/image.jpeg"),
              alignment: (activeIndex == 0)
                  ? const Alignment(-0.6, 1)
                  : const Alignment(-0.5, 1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: topMargin * 1.9.h),
          child: Column(
            children: [
              CarouselSlider.builder(
                  carouselController: controller1,
                  itemCount: 2,
                  itemBuilder: (context, index, realIndex) {
                    showtoast();
                    if (index == 0) {
                      return buildPage(context, Colors.blue.withOpacity(0.3),
                          "Prepaid", activeIndex);
                    } else {
                      return buildPage(context, Colors.pink.withOpacity(0.3),
                          "Pay Later", activeIndex);
                    }
                  },
                  options: CarouselOptions(
                      initialPage: 0,
                      enableInfiniteScroll: false,
                      // viewportFraction: 1,
                      height: 300.h,
                      onPageChanged: ((index, reason) => {
                            controller2.animateToPage(index),
                            setState(() => {activeIndex = index}),
                          }))),
              // scrolling points
              buildIndicator(activeIndex),
              // transactions
              buildTransactions(activeIndex, this, controller1)
            ],
          ),
        ),
      ]),
    );
  }
}

showtoast() => Fluttertoast.showToast(
    msg: "This is Center Short Toast",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey,
    textColor: Colors.red,
    fontSize: 16.0);
            

// bool value = true;
// Widget buildSwitch() => Transform.scale(
//       scale: 1.7,
//       child: Switch.adaptive(
//         thumbColor: MaterialStateProperty.all(Colors.white),
//         trackColor: MaterialStateProperty.all(Colors.green),
//         // activeColor: Colors.blueAccent,
//         // activeTrackColor: Colors.blue.withOpacity(0.4),
//         // inactiveThumbColor: Colors.orange,
//         // inactiveTrackColor: Colors.black87,
//         splashRadius: 30,
//         value: value,
//         onChanged: (v) {
//           value = v;
//         },
//       ),
//     );

// Clipboard.setData(ClipboardData(text: email)).then((_){
//  Fluttertoast.showToast(
//                 msg: "This is Center Short Toast",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.CENTER,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.grey,
//                 textColor: Colors.red,
//                 fontSize: 16.0),}