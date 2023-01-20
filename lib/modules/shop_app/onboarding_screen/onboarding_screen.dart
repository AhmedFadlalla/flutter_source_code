import 'package:bmi_flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:bmi_flutter_app/shared/component/components.dart';
import 'package:bmi_flutter_app/shared/network/local/cach_helper.dart';
import 'package:bmi_flutter_app/shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  void submit(){
    navigateAndFinsh(context,ShopLoginScreen());
    CachHelper.saveData(key: 'onBoarding', value: true);
  }
  List<BoardingModel> boardItems = [
    BoardingModel(
        image: 'assets/images/board.jpg',
        title: 'Screen Title 1',
        body: 'Screen Body 1'),
    BoardingModel(
        image: 'assets/images/board.jpg',
        title: 'Screen Title 2',
        body: 'Screen Body 2'),
    BoardingModel(
        image: 'assets/images/board.jpg',
        title: 'Screen Title 3',
        body: 'Screen Body 3'),
  ];
 bool isLast=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextButton(
              text: 'SKIP',
              pressedFunction: (){
                submit();
              },)

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==boardItems.length-1){
                    setState(() {
                        isLast=true;
                    });
                  }
                  else{
                    setState(() {
                      isLast=false;
                    });
                  }

                },
                physics: BouncingScrollPhysics(),
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildItemBoard(boardItems[index]),
                itemCount: boardItems.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      expansionFactor: 4,
                      spacing: 5.0,
                      activeDotColor: defultColor,
                    ),
                    count: boardItems.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if(isLast){
                      submit();
                    }
                    else{
                      boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750 ,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }



                  },
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemBoard(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 14.0),
          ),
        ],
      );
}
