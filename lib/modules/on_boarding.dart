import 'package:abu_zaid/models/models.dart';
import 'package:abu_zaid/modules/login.dart';
import 'package:abu_zaid/network/local/cache_helper.dart';
import 'package:abu_zaid/shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboard1.jpg', title: 'title 1', body: 'body 1'),
    BoardingModel(
        image: 'assets/images/onboard2.jpg', title: 'title 2', body: 'body 2'),
    BoardingModel(
        image: 'assets/images/onboard3.png', title: 'title 3', body: 'body 3'),
  ];

  void submit() {
    CacheHelper.saveDate(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context: context, widget: LoginScreen());
      }
    });
  }

  var boardController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: () {
                  submit();
                },
                child: Text('SKIP'))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Expanded(
                // PageView means that i have many pages in one page :
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardController,
                  onPageChanged: (int index) {
                    // if the index equal the index of the last page then :
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
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
                        if (isLast) {
                          submit();
                        } else {
                          boardController.nextPage(
                              duration: Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
