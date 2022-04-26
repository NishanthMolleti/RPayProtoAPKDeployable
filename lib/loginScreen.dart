// ignore_for_file: file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:temp/config.dart';
import '../main.dart';
import 'myhome.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

dynamic getUserfromInfo(contact) async {
  var url = returnHost()+":8080";
  final response =
      await http.get(Uri.http(url, "walletengine/user/" + contact));
  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    balance = jsonResponse["balance"];
    uname = jsonResponse["name"];
    uid = jsonResponse["user_login_id"];
    return jsonResponse;
  }
}

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  String userId = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Builder(builder: (context) {
          return Center(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 25.0.h),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 80.0.w, vertical: 80.0.h),
                  child: Container(
                    alignment: Alignment.center,
                    width: 200.w,
                    height: 75.h,
                    child: Image.asset(
                      "assets/images/RakutenPay.jpg",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, left: 30.w, right: 30.w),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'User ID',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 25.0.sp,
                        color: Colors.black,
                      ),
                      hintStyle:
                          TextStyle(color: Colors.black, fontSize: 30.0.sp),
                    ),
                    onChanged: (value) {
                      userId = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.0.h, left: 30.w, right: 30.w),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      labelStyle: TextStyle(
                        fontSize: 25.0.sp,
                        color: Colors.black,
                      ),
                      hintStyle:
                          TextStyle(color: Colors.white, fontSize: 30.0.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35.0.h),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: 150.w,
                    height: 50.h,
                    child: FloatingActionButton.extended(
                      elevation: 1,
                      heroTag: "Hero6",
                      foregroundColor: Colors.white,
                      label: const Text("Login"), //remove the variable
                      icon: const Icon(Icons.login),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      onPressed: () async {
                        final result = await Connectivity().checkConnectivity();
                        if (result == ConnectivityResult.none) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                  "You are not connected to internet. Please check your connection"),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {},
                              )));
                        } else {
                          await getUserfromInfo(userId);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const MyHomePage()),
                              (route) => false);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ));
        }),
      ),
    );
  }
}
