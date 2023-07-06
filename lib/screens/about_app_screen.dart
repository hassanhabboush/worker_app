import 'package:flutter/material.dart';
import 'package:worker_app/api/controllers/about_app_api_controller.dart';
import 'package:worker_app/models/about_app.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  List<AboutApp> _aboutApp = <AboutApp>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AboutAppApiController().getAbout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      color: Color(0xff272727),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                        color: Colors.white,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: 110,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'About App',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 45),
            Image(image: AssetImage('assets/images/layer3.png')),
            SizedBox(height: 44.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 47,
                  height: 47,
                  child: Icon(
                    Icons.language,
                    size: 23.79,
                    color: Color(0xff272727),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF6F7FB),
                    border: Border.all(
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(width: 33),
                Container(
                  width: 47,
                  height: 47,
                  child: Image.asset('assets/icons/ic_facebook.png'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF6F7FB),
                    border: Border.all(
                      color: Color(0xff000000),
                    ),
                  ),
                ),
                SizedBox(width: 33),
                GestureDetector(
                  // onTap: (){Navigator.pushNamed(context, '/main_screen');},
                  child: Container(
                    width: 47,
                    height: 47,
                    child: Image.asset('assets/icons/ic_instagram.png'),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF6F7FB),
                      border: Border.all(
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 33),
                Container(
                  width: 47,
                  height: 47,
                  child: Image.asset('assets/icons/ic_twitter.png'),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF6F7FB),
                    border: Border.all(
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 44),
            // Text('There are many variations of passages of Lorem\nIpsum available, but the majority have suffered\nalteration in some form, by injected humour, or\nrandomised words which don’t look even slightly\nbelievable. If you are going to use a passage of\nLorem Ipsum,',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 15),)
            if (_aboutApp.length == null)
              Text(
                _aboutApp[y!].description,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
          ],
        ),
      ),
    );
  }

  int? y;
}
