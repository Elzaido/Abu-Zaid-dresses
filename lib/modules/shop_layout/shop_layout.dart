import 'package:abu_zaid/modules/login/login.dart';
import 'package:abu_zaid/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abu Zaid'),
      ),
      body: TextButton(
          onPressed: () {
            CacheHelper.removeData(key: 'token').then((value) {
              if (value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    // delete brevios pages when i go to the next page:
                    (Route<dynamic> route) => false);
              }
            });
          },
          child: Text('SIGN OUT')),
    );
  }
}
