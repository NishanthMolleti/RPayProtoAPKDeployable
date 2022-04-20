import 'package:flutter/material.dart';
import 'package:test/topUpPage.dart';

Widget topUp(context) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          child: const Text(
            "Top up your card",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.payment,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Credit/Debit  card",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: [
              const Icon(
                Icons.house,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              const SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TopupScreen()),
                  );
                },
                child: const Expanded(
                  child: Text(
                    "Bank",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.paypal,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "PayPal",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        Container(
          child: Row(
            children: const [
              Icon(
                Icons.add,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                  child: Text(
                "Cash Back",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18, color: Colors.black),
              )),
              Text(
                "\$87.35",
                textAlign: TextAlign.right,
                style: TextStyle(color: Colors.blue, fontSize: 18),
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey, thickness: 0.3, endIndent: 0),
        const SizedBox(
          height: 100,
        ),
      ]),
    );