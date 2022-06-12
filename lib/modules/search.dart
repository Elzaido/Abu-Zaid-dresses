// ignore_for_file: non_constant_identifier_names

import 'package:abu_zaid/shared/component/component.dart';
import 'package:abu_zaid/shared/search_cubit/search_cubit.dart';
import 'package:abu_zaid/shared/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  final searchcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) => {},
          builder: (context, state) => Scaffold(
                appBar: AppBar(),
                body: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: formField(
                            onSubmit: (value) {
                              SearchCubit.get(context).search(text: value);
                            },
                            control: searchcontroller,
                            isScure: false,
                            label: 'Search',
                            prefIcon: Icon(Icons.search),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Search must not be empty';
                              }
                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (state is LoadingSaerchState)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LinearProgressIndicator(),
                        ),
                      if (state is SuccessSearchState)
                        Expanded(
                            child: ListView.separated(
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) => productItem(
                                      SearchCubit.get(context)
                                          .model!
                                          .data
                                          .data[index],
                                      context,
                                    ),
                                separatorBuilder: (context, index) => Container(
                                      height: 1,
                                      color: Colors.grey[300],
                                    ),
                                itemCount: SearchCubit.get(context)
                                    .model!
                                    .data
                                    .data
                                    .length))
                    ],
                  ),
                ),
              )),
    );
  }
}
