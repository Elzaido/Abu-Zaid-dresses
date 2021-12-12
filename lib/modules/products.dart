import 'package:abu_zaid/models/home_model.dart';
import 'package:abu_zaid/shared/shop_cubit/cubit3.dart';
import 'package:abu_zaid/shared/shop_cubit/state3.dart';
import 'package:abu_zaid/shared/styles/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ShopCubit.get(context).homeModel != null
              ? productsBuilder(ShopCubit.get(context).homeModel)
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget productsBuilder(HomeModel? model) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
              items: model!.data!.banners
                  .map((e) => Image(image: NetworkImage('${e.image}')))
                  .toList(),
              options: CarouselOptions(
                height: 250.0,
                initialPage: 0,
                viewportFraction: 1.0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(seconds: 1),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollDirection: Axis.horizontal,
              )),
          SizedBox(
            height: 10.0,
          ),
          GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
              childAspectRatio: 1 / 1.75,
              children: List.generate(
                model.data!.products.length,
                (index) => itemGridBuilder(model.data!.products[index]),
              )),
        ],
      ),
    );
  }

  Widget itemGridBuilder(ProductsModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image(
                image: NetworkImage(model.image),
                width: double.infinity,
                height: 200,
                // fit: BoxFit.cover,
              ),
              if (model.discount != 0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
            height: 5.0,
          ),
          Text(
            model.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13.0,
              height: 1.3,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                // it written like this because it's not a string :
                '${model.price.round()}',
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
              if (model.discount != 0)
                Text(
                  // it written like this because it's not a string :
                  '${model.oldPrice.round()}',
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
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 12.0,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
