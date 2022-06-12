import 'package:abu_zaid/modules/login.dart';
import 'package:abu_zaid/network/local/cache_helper.dart';
import 'package:abu_zaid/shared/component/component.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);
  var form_key = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final emailControl = TextEditingController();
  final phoneControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit c = ShopCubit.get(context);
        nameControl.text = c.userData.data!.name!;
        emailControl.text = c.userData.data!.email!;
        phoneControl.text = c.userData.data!.phone!;
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Form(
              key: form_key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is ShopLoadingUpdateUserDataState)
                    LinearProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  formField(
                      control: nameControl,
                      isScure: false,
                      label: 'Name',
                      prefIcon: Icon(Icons.person),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  formField(
                      control: emailControl,
                      isScure: false,
                      label: 'Email',
                      prefIcon: Icon(Icons.email),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  formField(
                      control: phoneControl,
                      isScure: false,
                      label: 'Phone',
                      prefIcon: Icon(Icons.phone),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone must not be empty';
                        }
                        return null;
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            CacheHelper.removeData(key: 'token').then((value) {
                              if (value) {
                                navigateAndFinish(
                                    context: context, widget: LoginScreen());
                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'LOGOUT',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                      SizedBox(
                        width: 30,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (form_key.currentState!.validate()) {
                              ShopCubit.get(context).updateUserData(
                                  name: nameControl.text,
                                  email: emailControl.text,
                                  phone: phoneControl.text);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'UPDATE',
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
