import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  String? image;
  String? title;
  String? body;

  BoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

// ignore: must_be_immutable
class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard1.jpg', title: 'title 1', body: 'body 1'),
    BoardingModel(
        image: 'assets/images/onboard2.jpg', title: 'title 2', body: 'body 2'),
    BoardingModel(
        image: 'assets/images/onboard3.png', title: 'title 3', body: 'body 3'),
  ];

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  itemBuilder: (context, index) => itemBuilder(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5,
                    ),
                  ),
                  Spacer(),
                  FloatingActionButton(
                      onPressed: () {
                        boardController.nextPage(
                            duration: Duration(
                              milliseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

Widget itemBuilder(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage('${model.image}')),
        SizedBox(
          height: 30,
        ),
        Text(
          '${model.title}',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          '${model.body}',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
