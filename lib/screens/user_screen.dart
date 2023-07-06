import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:worker_app/utils/helpers.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> with Helpers {
  bool _obscureText = true;
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  PhoneNumber? _phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF6F7FB),
        body: Stack(
          children: [
            Container(
              height: 158,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff346EDF),
                    Color(0xff6FC8FB),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/setting_screen');
                      },
                      child: Icon(
                        Icons.settings_outlined,
                        color: Color(0xffFFFFFF),
                        size: 24,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(top: 35.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: ListView(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                        children: [
                          SizedBox(height: 70),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              // Icon(Icons.add),
                              Text(
                                'Seraj Al Mutawa',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 24,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Riyadh, Saudi Arabia',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff272727)),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 104,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/img.png')),
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ],
                ),
                Container(
                  height: 289,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(color: Color(0xff474D60))]),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    children: [
                      SizedBox(height: 76),
                      ListTile(
                        leading: Text(
                          'Language',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.black),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, '/withdraw_Select_screen');
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffC2CECE),
                            size: 20,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'My Rates',
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
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Contact us',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Contact us',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 28),
                                      TextField(
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                            hintText: 'First Name',
                                            hintStyle: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xffC2CECE),
                                                fontWeight: FontWeight.w400),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
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
                                      InternationalPhoneNumberInput(
                                        textFieldController:
                                            _phoneTextController,
                                        inputDecoration: InputDecoration(
                                          fillColor: Color(0xffF2F6F6),
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xffAF8344))),
                                          label: Text(
                                            '5000|',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xffAF8344),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          // hintText: '',
                                          hintTextDirection:
                                              TextDirection.ltr,
                                          // hintStyle: TextStyle(color: Color(0xff0E4DFB),fontSize: 16,fontWeight: FontWeight.w500),
                                          border: InputBorder.none,
                                          contentPadding:
                                              EdgeInsets.symmetric(
                                                  vertical: 10,
                                                  horizontal: 21.5),
                                        ),
                                        onInputChanged:
                                            (PhoneNumber? number) {
                                          setState(() {
                                            _phoneNumber = number;
                                          });
                                        },
                                        // selectorConfig: SelectorConfig(
                                        //   selectorType:
                                        //       PhoneInputSelectorType
                                        //           .DIALOG,
                                        // ),
                                        textStyle: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                        ),
                                        initialValue:
                                            PhoneNumber(isoCode: 'SA'),
                                      ),
                                      SizedBox(height: 11),
                                      TextField(
                                        controller: _emailTextController,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          hintStyle: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xffC2CECE),
                                              fontWeight: FontWeight.w400),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
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
                                      Spacer(),
                                      Center(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('save '),
                                          style: ElevatedButton.styleFrom(
                                            alignment: Alignment.center,
                                            minimumSize: Size(327, 40),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            backgroundColor: Color(0xff272727),
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
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Text(
                          'Share App',
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
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 54,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff474D60),
                        // blurRadius: 6.0, // soften the shadow
                        // // spreadRadius: 6.0, //extend the shadow
                        // offset: Offset(
                        //   0.0, // Move to right 10  horizontally
                        //   3.0, // Move to bottom 10 Vertically
                        // ),
                      ),
                    ],
                    shape: BoxShape.rectangle,
                  ),
                  child: SizedBox(
                    height: 150,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/main_screen');
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Color(0xffAF8344),
                          size: 16,
                        ),
                        label: Text(
                          'SIGN OUT',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff0E4DFB)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
