import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/onboard/ondoard.dart';
import 'package:worker_app/prefs/user_preferences_controller.dart';
import 'package:worker_app/screens/auth/login_service_screen.dart';
import 'package:worker_app/screens/auth/register_service_screen.dart';
import 'package:worker_app/screens/main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      String route =
          UserPreferencesController().getValueFor<bool>(PrefKeys.loggedIn) ??
                  false
              ? "/main_screen"
              : "/onboard";
    //
    //

      // print(_sharedPreferences); // طباعة قيمة _sharedPreferences
      // print(PrefKeys.loggedIn); // طباعة قيمة PrefKeys.onBoard.name


// طباعة القيمة المسترجعة من _sharedPreferences
//       bool onBoardValue = UserPreferencesController().getValueFor<bool>(PrefKeys.loggedIn) ?? false;
//       print(onBoardValue);
//       print('loggedIn: ${UserPreferencesController().getValueFor<bool>(PrefKeys.loggedIn)}');
//
//       String email = UserPreferencesController().getValueFor<String>(PrefKeys.email) ?? "----";
//       print(email);
//       print('email: ${UserPreferencesController().getValueFor<String>(PrefKeys.email)}');

      Navigator.pushReplacementNamed(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff346EDF),
                    Color(0xff6FC8FB),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/laye.png',
                  alignment: Alignment.centerRight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Future<bool> checkOnboardingStatus() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool isViewed = prefs.getBool('onBoard') ?? false;
  //
  //   return isViewed;
  // }
}
