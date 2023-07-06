import 'package:flutter/material.dart';
import 'package:worker_app/utils/helpers.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({Key? key}) : super(key: key);

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen>
    with Helpers {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.asset(
              'assets/images/w.png',
              alignment: Alignment.centerRight,
              // width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 185),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff0E4DFB),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 204),
              height: 269,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff474D60),
                    // blurRadius: 6,
                    offset: Offset(0, 0.3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 28,left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 43,
                          height: 72,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                              colors: [
                                Color(0xff6FC8FB),
                                Color(0xff0E4DFB),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('4.5',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.white)),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 15.5,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 14),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            SizedBox(height: 10),
                            Text(
                              'Completed',
                              style: TextStyle(
                                  color: Color(0xffFF745B),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text('Craftsman Carpenter',
                                style: TextStyle(
                                    color: Color(0xff353B50),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(height: 2),
                            Text('Order #52001',
                                style: TextStyle(
                                    color: Color(0xff707070), fontSize: 15)),
                            SizedBox(height: 6),

                            Text('28 Nov 2019',
                                style: TextStyle(
                                    color: Color(0xff0E4DFB),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(

                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(75, 24),
                          backgroundColor: Color(0xff272727),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )
                      ),
                      onPressed: (){}, child: Text('Details',style: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.bold)),
                    ),
                    Text('Hollywood isn’t the only stateside destination that\nknows how to whip up a love story for the ages – \nwe’ve handpicked a list of spots....',style: TextStyle(color:Colors.black,fontSize: 15)),
                    SizedBox(height: 6),
                    Text('Read more…',style: TextStyle(color:Color(0xffAF8344),fontSize: 12,fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 474),
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff474D60),
                    blurRadius: 0,
                    offset: Offset(0, 0.3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Craftsman  Details',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffB28745)),
                  ),
                  SizedBox(height: 9.5),
                  Divider(
                    thickness: 1,
                    // thickness of the line
                    indent: 93.5,
                    // empty space to the leading edge of divider.
                    endIndent: 93.5,
                    // empty space to the trailing edge of the divider.
                    color: Color(0xffB28745),
                    // The color to use when painting the line.
                    height: 1,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 527),
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/withdraw.png')),
                  SizedBox(height: 25.1,),
                  Text('No Any Provider Right now',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Color(0xffFF745B)),),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/successfully_screen');
                      },
                      child: Text('Rate Provider',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 33),
                        backgroundColor: Color(0xff222328),
                        shadowColor: Color(0xffE9C75E),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//
// Positioned(
// top: 100,left: 16,
// child: ClipRRect(
// borderRadius: BorderRadius.circular(16),
// child: Image(image: AssetImage('assets/images/profile.png'))))
