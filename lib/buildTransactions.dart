import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

import 'buildPayments.dart';

Widget buildTransactions(
  activeIndex,
  myHomePageState, CarouselController controller1,
) {
  return buildPayments(activeIndex, myHomePageState,controller1);
}
