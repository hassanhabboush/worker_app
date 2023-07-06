import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/constant.dart';
import 'package:worker_app/onboard/onboard_model.dart';
import 'package:worker_app/screens/auth/login_service_screen.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storOnBoardinfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
      appBar: AppBar(
        elevation: 0,
        // backgroundColor: currentIndex % 2 == 0 ? kwhite : kblue,
        actions: [
          TextButton(
              onPressed: () async {
                await _storOnBoardinfo();
                Navigator.pushReplacementNamed(context, 'login_service_screen');

              },
              child: Text('Skip'),),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          onPageChanged: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: index % 2 == 0 ? 10 : 0,
                ),
                Image.asset(screens[index].img),

                SizedBox(
                  height: index % 2 == 0 ? 68 : 0,
                ),

                Text(
                  screens[index].text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 21.0,
                    // color: currentIndex == index ? kblack : kwhite),
                    color: Color(0xff0E9CF9),
                  ),
                ),
                // Text(
                //   screens[index].desc,
                //   textAlign: TextAlign.center,
                //   style: TextStyle(
                //       fontSize: 27.0,
                //       fontWeight: FontWeight.bold,
                //       color: currentIndex == index ? kblack : kwhite),
                // ),

                Container(
                  height: 10.0,
                  child: ListView.builder(
                    itemCount: screens.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.0),
                            width: currentIndex == index ? 25.0 : 8.0,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index ? kbrown : kbrown300,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await _storOnBoardinfo();
                    if (index == screens.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginServiceScreen(),
                          ));
                    }
                    _pageController.nextPage(
                        duration: Duration(microseconds: 300),
                        curve: Curves.bounceIn);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      // color: index % 2 == 0 ? kblue : kwhite,
                      color: kblue,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 16.0,
                            // color: index % 2 == 0 ? kwhite : kblue,
                            color: kwhite,
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_sharp,
                          // color: index % 2 == 0 ? kwhite : kblue,
                          color: kwhite,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
