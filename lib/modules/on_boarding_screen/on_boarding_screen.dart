import 'package:e_commerce/modules/login_screen/login_screen.dart';
import 'package:e_commerce/shared/local/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class BoardingModel {
  final String image;
  final String body;
  final String title;

  BoardingModel({
    required this.image,
    required this.body,
    required this.title,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
  static String id = 'OnBoarding';
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardingController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/on-boarding-cover.jpg',
        body: 'Body Boarding 1',
        title: 'Title Boarding 1'),
    BoardingModel(
        image: 'assets/on-boarding-cover.jpg',
        body: 'Body Boarding 2',
        title: 'Title Boarding 2'),
    BoardingModel(
        image: 'assets/on-boarding-cover.jpg',
        body: 'Body Boarding 3',
        title: 'Title Boarding 3'),
  ];
  bool isLast = false;

  void submit(){
    CacheHelper.saveData(key:'onBoarding', value: true).then((value){
      if(value){
        // Navigator.pushNamed(context, LoginScreen.id);   OR
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
              (route) {
            return false;
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(onPressed: (){
              submit();
            }, child: Text('Skip',style: TextStyle(
              fontSize: 18.0
            ),)),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: boardingController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                      //print('it is last Page');
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardingController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      spacing: 5.0,
                      expansionFactor: 4.0,
                    ),
                    count: boarding.length,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        // navigateAndReplacement(context, LoginScreen());
                        submit();
                      } else {
                        boardingController.nextPage(
                            duration: Duration(milliseconds: 650),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage('${model.image}'),
        ),
      ),
      SizedBox(
        height: 20.0,
      ),
      Text(
        '${model.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
        ),
      ),
      SizedBox(
        height: 10.0,
      ),
    ],
  );
}
