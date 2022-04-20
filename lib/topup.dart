import 'package:flutter/material.dart';
import 'package:test/topUpPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topUp(context) => Padding(
      padding:  EdgeInsets.symmetric(vertical:10.0.h,horizontal: 10.0.w),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
         SizedBox(
          height: 25.h,
        ),
        Container(
          child:  Text(
            "Top up your card",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
         SizedBox(
          height: 40.h,
        ),
        Container(
          child: Row(
            children:  [
              Icon(
                Icons.payment,
                color: Colors.black,
                size: 24.0.sp,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25.w,
              ),
              Expanded(
                  child: Text(
                "Credit/Debit  card",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: [
               Icon(
                Icons.house,
                color: Colors.black,
                size: 24.0.sp,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
               SizedBox(
                width: 25.w,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopupScreen()),
                  );
                },
                child:  Expanded(
                  child: Text(
                    "Bank",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18.sp, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children:  [
              Icon(
                Icons.paypal,
                color: Colors.black,
                size: 24.0.sp,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25.w,
              ),
              Expanded(
                  child: Text(
                "PayPal",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children:  [
              Icon(
                Icons.add,
                color: Colors.black,
                size: 24.0.sp,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25.w,
              ),
              Expanded(
                  child: Text(
                "Cash Back",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              )),
              Text(
                "\$87.35",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue, fontSize: 18.sp),
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
         SizedBox(
          height: 100.h,
        ),
      ]),
    );