import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'NavBar.dart';
import 'main.dart';

class qrcodepage extends StatelessWidget {
  const qrcodepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/RakutenPay.jpg",
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: Center(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //      mainAxisAlignment: MainAxisAlignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImage(
              data: '{ "user_login_id" : "$uid" , "name": "$uname" }',
              version: QrVersions.auto,
              size: 320,
            )
          ],
        ),
      ),
    );
  }
}
