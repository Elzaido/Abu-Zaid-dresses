import 'package:abu_zaid/modules/login.dart';
import 'package:abu_zaid/network/local/cache_helper.dart';
import 'package:abu_zaid/shared/component/component.dart';
import 'package:abu_zaid/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
              color: defaultColor,
              child: TextButton(
                  onPressed: () {
                    CacheHelper.removeData(key: 'token').then((value) {
                      if (value) {
                        navigateAndFinish(
                            context: context, widget: LoginScreen());
                      }
                    });
                  },
                  child: Text(
                    'LOGOUT',
                    style: TextStyle(color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
