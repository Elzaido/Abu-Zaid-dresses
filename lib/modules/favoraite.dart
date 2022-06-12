// ignore_for_file: sized_box_for_whitespace

import 'package:abu_zaid/shared/component/component.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favoraite extends StatelessWidget {
  const Favoraite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return state is! ShopChangeFavoriteLoadingState
              ? ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => productItem(
                        ShopCubit.get(context)
                            .favoriteGetModel
                            .data
                            .data[index]
                            .product,
                        context,
                      ),
                  separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                  itemCount:
                      ShopCubit.get(context).favoriteGetModel.data.data.length)
              : Center(child: CircularProgressIndicator());
        });
  }
}
