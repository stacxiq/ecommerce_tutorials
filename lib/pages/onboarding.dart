import 'package:ecommerce_tutorials/models/onboarding.dart';
import 'package:ecommerce_tutorials/pages/tabs.dart';
import 'package:ecommerce_tutorials/widgets/dot.dart';
import 'package:ecommerce_tutorials/widgets/slide.dart';
import 'package:flutter/material.dart';

// stateless widget mutable متتغير
// stateful widget immutable قابلة للتغير
class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int active = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      controller: pageController,
      itemCount: onBoardingList.length,
      // block code
      onPageChanged: (index) {
        print('index : $index');
        setState(() {
          active = index;
        });
      },
      itemBuilder: (BuildContext context, int index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Slide(
                title: onBoardingList[index].title,
                subtitle: onBoardingList[index].subtitle,
                image: onBoardingList[index].image),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  onBoardingList.length,
                  (index) => dot(
                        index: index,
                        active: active,
                      )),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  fixedSize: Size(
                    MediaQuery.of(context).size.width,
                    45,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  if (active < onBoardingList.length - 1) {
                    pageController.animateToPage(active + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  } else {
                    // navigator
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => TabsPage()),
                        (route) => false);
                  }
                },
                child: Text(
                  active == onBoardingList.length - 1 ? 'بدء' : 'التالي',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                /*...*/
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => TabsPage()),
                    (route) => false);
              },
              child: Text(
                'تخطي',
              ),
            ),
            Spacer(),
          ],
        );
      },
    ));
  }
}

// custom widget
