import 'dart:ui';
import 'package:abu_zaid/shared/component/component.dart';
import 'package:abu_zaid/shared/regist_cubit/cubit2.dart';
import 'package:abu_zaid/shared/regist_cubit/state2.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Register extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final phoneControl = TextEditingController();
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  final passConControl = TextEditingController();
  bool isPass1 = true;
  bool isPass2 = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white60),
            body: Container(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Let\'s Get Started!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Create an account to Q Allure to get all features',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        formField(
                            control: nameControl,
                            isScure: false,
                            label: 'name',
                            prefIcon: Icon(Icons.person_outline),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Name must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        formField(
                            control: emailControl,
                            isScure: false,
                            label: 'Email',
                            prefIcon: Icon(Icons.email),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Name must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        formField(
                            control: phoneControl,
                            isScure: false,
                            label: 'Phone',
                            prefIcon: Icon(Icons.phone_android),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Phone must not be empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        formField(
                            control: passConControl,
                            isScure: RegisterCubit.get(context).isPass2,
                            label: 'Password',
                            prefIcon: Icon(Icons.lock),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password must not be empty';
                              } else {
                                return null;
                              }
                            },
                            suffButton: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).scureChange2();
                                },
                                icon: RegisterCubit.get(context).isPass2
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye))),
                        SizedBox(
                          height: 20,
                        ),
                        formField(
                            control: passControl,
                            isScure: RegisterCubit.get(context).isPass,
                            label: 'Confirm Password',
                            prefIcon: Icon(Icons.lock),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Confirm must not be empty';
                              } else {
                                return null;
                              }
                            },
                            suffButton: IconButton(
                                onPressed: () {
                                  RegisterCubit.get(context).scureChange();
                                },
                                icon: RegisterCubit.get(context).isPass
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.remove_red_eye))),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(30)),
                          width: 200,
                          height: 50,
                          child: MaterialButton(
                              child: Text(
                                'CREATE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Processing Data',
                                      ),
                                    ),
                                  );
                                }
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account ?'),
                            SizedBox(
                              width: 1,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Login here!',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                  ),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
