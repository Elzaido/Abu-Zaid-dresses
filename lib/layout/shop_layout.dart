import 'package:abu_zaid/modules/search.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLayout extends StatelessWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          ShopCubit cubit = ShopCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('Abu Zaid'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      icon: Icon(Icons.search)),
                ],
              ),
              body: cubit.navPages[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index) {
                  cubit.changeNav(index);
                },
                currentIndex: cubit.currentIndex,
                items: cubit.navBarItems,
              ));
        });
  }
}
