import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:temp/TransactionComplete.dart';
import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:temp/config.dart';

import 'EnterAmount.dart';
import 'main.dart';

var jsonres;

sendPostRequest() async {
  Map data = {
    "sender": uid.toString(),
    "receiver": receiverUid,
    "amount": int.parse(text.toString().replaceAll(',', ''))
  };
  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  var body = json.encode(data);
  var url = returnHost() + ":8080";
  final response = await http.post(Uri.http(url, "walletengine/transfer"),
      body: body, headers: headers);
  jsonres = response.body;
  return "";
}

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          },
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Builder(builder: (context) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(left: 50)),
              const Text(
                "Pay \$",
                style: TextStyle(fontSize: 50),
              ),
              Text(
                text.toString(),
                style: const TextStyle(fontSize: 50),
              ),
              Text(
                " to " + receiverName.toString() + " ?",
                style: const TextStyle(fontSize: 50),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton.extended(
                    heroTag: "Hero4",
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
                        await sendPostRequest();
                        jsonres = json.decode(jsonres);
                        if (jsonres["status"] == 1) {
                          text = '0';
                          Navigator.of(context).popUntil(
                            (route) => route.isFirst,
                          );
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TransactionComplete()),
                          );
                        } else {
                          Navigator.of(context)
                              .pushNamed("/TransactionIncomplete");
                        }
                      }
                    },
                    backgroundColor: Colors.red,
                    extendedTextStyle: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                    label: const Text("Pay"),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
