// ignore_for_file: sized_box_for_whitespace

import 'package:abu_zaid/models/favorite_get_model.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:abu_zaid/shared/styles/colors.dart';
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
                  itemBuilder: (context, index) => favItem(
                      ShopCubit.get(context).favoriteGetModel, index, context),
                  separatorBuilder: (context, index) => Container(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                  itemCount:
                      ShopCubit.get(context).favoriteGetModel.data.data.length)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget favItem(FavoriteGetModel favoriteGetModel, index, context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: NetworkImage(
                        favoriteGetModel.data.data[index].product.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (favoriteGetModel.data.data[index].product.discount != 0)
                    Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3.0),
                        child: Text(
                          'DISCOUNT',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      favoriteGetModel.data.data[index].product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          favoriteGetModel.data.data[index].product.price
                              .toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: defaultColor,
                            fontSize: 12.0,
                            height: 1.3,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        if (favoriteGetModel
                                .data.data[index].product.discount !=
                            0)
                          Text(
                            favoriteGetModel.data.data[index].product.oldPrice
                                .toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                                height: 1.3,
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ShopCubit.get(context).changeFavorite(
                                  favoriteGetModel.data.data[index].product.id);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor: defaultColor,
                              child: Icon(
                                Icons.favorite_border,
                                size: 12.0,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
