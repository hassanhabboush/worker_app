import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:worker_app/utils/helpers.dart';

class SuccessfullyScreen extends StatefulWidget {
  const SuccessfullyScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfullyScreen> createState() => _SuccessfullyScreenState();
}

class _SuccessfullyScreenState extends State<SuccessfullyScreen> with Helpers {
  String? _selectedUser = 'u';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Stack(
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
                        margin: EdgeInsets.symmetric(
                            horizontal: 10, vertical: 185),
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
                          offset:
                              Offset(0, 0.3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 28, left: 20),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                          color: Color(0xff707070),
                                          fontSize: 15)),
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
                                )),
                            onPressed: () {},
                            child: Text('Details',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold)),
                          ),
                          Text(
                              'Hollywood isn’t the only stateside destination that\nknows how to whip up a love story for the ages – \nwe’ve handpicked a list of spots....',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 15)),
                          SizedBox(height: 6),
                          Text('Read more…',
                              style: TextStyle(
                                  color: Color(0xffAF8344),
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold))
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
                          offset:
                              Offset(0, 0.3), // changes position of shadow
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 19, left: 15),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/rectangle .png')),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15),
                                        Text(
                                          'Mohammed R.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 24,
                                  child: RadioListTile<String>(
                                    // title: Text('Female'),
                                    value: 'r',
                                    groupValue: _selectedUser,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedUser = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 19, left: 15),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/rectangle .png')),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15),
                                        Text(
                                          'Mohammed R.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 24,
                                  child: RadioListTile<String>(
                                    // title: Text('Female'),
                                    value: 'u',
                                    groupValue: _selectedUser,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedUser = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 19, left: 15),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/rectangle .png')),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15),
                                        Text(
                                          'Mohammed R.',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 4),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star,
                                              color: Color(0xff0E4DFB),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                            SizedBox(width: 2),
                                            Icon(
                                              Icons.star_border_sharp,
                                              color: Color(0xffAF8344),
                                              size: 13,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 24,
                                  child: RadioListTile<String>(
                                    // title: Text('Female'),
                                    value: 'y',
                                    groupValue: _selectedUser,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedUser = value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 10),
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Successfully selected',
                                        style: TextStyle(
                                            color: Color(0xff0E4DFB),
                                            fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                      content: SizedBox(
                                        height: 130,
                                        width: 327,
                                        child: Column(
                                          children: [
                                           Divider(
                                             height: 1,
                                             color: Color(0xff0E4DFB),
                                             thickness: 2,
                                             endIndent: 22,
                                             indent: 22,
                                           ),
                                            Image(image: AssetImage('assets/images/true.png')),
                                            Text('Your request is now being\nprocessed',
                                              style: TextStyle(
                                                  color: Color(0xff0E4DFB),
                                                  fontSize: 20), textAlign: TextAlign.center,),

                                          ],
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: GradientColors
                                                    .facebookMessenger,
                                                // colors: [
                                                //
                                                //   Colors.red,
                                                //   Colors.yellow,
                                                // ]
                                                // colors: GradientColors.facebookMessenger
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                            ),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minWidth: 88.0,
                                                minHeight: 36.0,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'OK',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              // minimumSize:
                                              //     Size(182, 24),
                                              backgroundColor:
                                                  Colors.transparent,
                                              elevation: 0
                                              // shadowColor: Color(0xffE9C75E),
                                              ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: GradientColors.facebookMessenger,
                                    // colors: [
                                    //
                                    //   Colors.red,
                                    //   Colors.yellow,
                                    // ]
                                    // colors: GradientColors.facebookMessenger
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                    minWidth: 88.0,
                                    minHeight: 36.0,
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Confirm selection',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  // minimumSize: Size(double.infinity, 33),
                                  backgroundColor: Colors.transparent,
                                  elevation: 0
                                  // shadowColor: Color(0xffE9C75E),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
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
