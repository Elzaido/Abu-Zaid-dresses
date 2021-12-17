import 'package:abu_zaid/models/categories_model.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => categoryItem(
                  ShopCubit.get(context)
                      .categoryModel!
                      .data!
                      .categoryData[index]),
              separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.grey[200],
                      height: 1,
                      width: double.infinity,
                    ),
                  ),
              itemCount: ShopCubit.get(context)
                  .categoryModel!
                  .data!
                  .categoryData
                  .length);
        });
  }

  Widget categoryItem(DataModel? dataModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image(
            image: NetworkImage(dataModel!.image),
            height: 100.0,
            width: 100.0,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 20.0),
          Text(
            dataModel.name,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.keyboard_arrow_right_sharp),
            iconSize: 35.0,
          )
        ],
      ),
    );
  }
}
