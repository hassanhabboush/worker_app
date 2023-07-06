import 'package:flutter/material.dart';
import 'package:worker_app/api/controllers/create_rder_api_controller.dart';
import 'package:worker_app/screens/main_screen.dart';
import 'package:worker_app/screens/service_screen.dart';

class CardInfoFilledScreen extends StatelessWidget {
  const CardInfoFilledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff172B4D),
                      size: 24,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/illustration.png'),
                  ),
                ),
                SizedBox(height: 73),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'ORDER ',
                          style: TextStyle(
                            color: Color(0xff272727),
                            fontSize: 24,
                          ),
                          children: [
                            TextSpan(
                              text: 'Done',
                              style: TextStyle(
                                color: Color(0xff0E4DFB),
                                fontSize: 24,
                              ),
                            ),
                            TextSpan(
                              text: '!',
                              style: TextStyle(
                                color: Color(0xffAF8344),
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 13),
                    Text(
                      'The ORDER has been sent. A technician will \ncontact you',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: 255,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.centerStart,
                          end: AlignmentDirectional.centerEnd,
                          colors: [
                            Color(0xff346EDF),
                            Color(0xff6FC8FB),
                          ],
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ));
                        },
                        child: Text('Go to Home',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),

                        style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.transparent,
                          minimumSize: Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}
