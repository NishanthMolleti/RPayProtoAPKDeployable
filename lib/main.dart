import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:test/loginScreen.dart';
import 'package:test/splash.dart';
import 'myhome.dart';
import 'package:flutter/services.dart';

String receiverUid = "";
String receiverName = "";
bool refresh = true;
dynamic uid = "anirudh@rakuten.com";
dynamic uname = "Anirudh G";
int balance = 0;

dynamic getBalance() async {
  var url = "10.0.2.2:8080";
  final response = await http.get(Uri.http(url, "walletengine/balance/" + uid));

  if (response.statusCode == 200) {
    balance = int.parse(response.body.toString());
    return '';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Splash(),
      ),
      designSize: const Size(375, 812),
    );
  }
}
