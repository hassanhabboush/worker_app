import 'dart:io';
import 'package:flutter/material.dart';
import 'package:worker_app/utils/helpers.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> with Helpers {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 110,
                      width: double.infinity,
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/background1.png'),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 49),
                          alignment: Alignment.topCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'More',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 12.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 44, right: 19),
                        alignment: Alignment.topLeft,
                        width: 33,
                        height: 33,
                        decoration: BoxDecoration(
                          color: Color(0xff99D6FC),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_back_ios,
                                color: Color(0xffFFFFFF), size: 20)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 14),
            ListTile(
              leading: Text(
                'Change Password',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    showModalBottomSheet(

                      backgroundColor: Colors.white,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                      ),
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Container(
                          // height: MediaQuery.of(context).size.height * 0.8,
                          // width: MediaQuery.of(context).size.width,
                          height: 406,
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Change Password',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 28),
                              TextField(
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                    hintText: 'Current Password',
                                    hintStyle: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xffC2CECE),
                                        fontWeight: FontWeight.w400),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      child: Icon(_obscureText
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffF0F0F0),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 11),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'New Password',
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xffC2CECE),
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffF0F0F0),
                                    ),
                                  ),
                                  fillColor: Color(0xffF2F6F6),
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: 11),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xffC2CECE),
                                      fontWeight: FontWeight.w400),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffF0F0F0),
                                    ),
                                  ),
                                  fillColor: Color(0xffF2F6F6),
                                  filled: true,
                                ),
                              ),
                              SizedBox(height: 70),
                              Center(
                                child: Container(
                                  // height: 50,
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Color(0xff293340),
                                    //     blurRadius: 4,
                                    //     offset: Offset(0, -2),
                                    //   ),
                                    // ],
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('save '),
                                    style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      minimumSize: Size(327, 40),
                                      shape:  RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      backgroundColor: Color(0xff272727),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'FAQ‘s',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/fqa_screen');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'About App',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/about_app_screen');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'Terms & Conditions',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'Rate App',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            ListTile(
              leading: Text(
                'Delete Account',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
