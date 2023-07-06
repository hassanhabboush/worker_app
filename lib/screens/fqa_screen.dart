import 'dart:io';
import 'package:flutter/material.dart';
import 'package:worker_app/utils/helpers.dart';

class FQAScreen extends StatefulWidget {
  const FQAScreen({Key? key}) : super(key: key);

  @override
  State<FQAScreen> createState() => _FQAScreenState();
}

class _FQAScreenState extends State<FQAScreen> with Helpers {
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
                                'FQA',
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
            SizedBox(height: 10.5),
            ListTile(
              leading: Text(
                'How does this app protect my privacy?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'Am I able to delete my account?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'What happens to my data if I delete my account',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/about_app_screen');
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xffC2CECE),
                    size: 20,
                  )),
            ),
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'Is my account safe?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'Does this app track my location?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'Am I able to delete my account?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'How does this app protect my privacy?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
            Divider(
              thickness: 0.5,
              height: 0.5,
              endIndent: 30.5,
              indent: 12.5,
              color: Color(0xffC2CECE),

            ),
            ListTile(
              leading: Text(
                'Am I able to delete my account?',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
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
