import 'package:flutter/material.dart';
import 'package:worker_app/onboard/ondoard.dart';
import 'package:worker_app/prefs/user_preferences_controller.dart';
import 'package:worker_app/screens/about_app_screen.dart';
import 'package:worker_app/screens/auth/login_service_screen.dart';
import 'package:worker_app/screens/auth/register_service_screen.dart';
import 'package:worker_app/screens/card_info_filled_screen.dart';
import 'package:worker_app/screens/card_info_screen.dart';
import 'package:worker_app/screens/choice_card_screen.dart';
import 'package:worker_app/screens/fqa_screen.dart';
import 'package:worker_app/screens/getting_started_screen.dart';
import 'package:worker_app/screens/main_screen.dart';
import 'package:worker_app/screens/more_screen.dart';
import 'package:worker_app/screens/my_homePage.dart';
import 'package:worker_app/screens/orders_screen.dart';
import 'package:worker_app/screens/service_screen.dart';
import 'package:worker_app/screens/setting_screen.dart';
import 'package:worker_app/screens/successfully_screen.dart';
import 'package:worker_app/screens/user_screen.dart';
import 'package:worker_app/screens/welcome_screen.dart';
import 'package:worker_app/screens/withdraw_Select_screen.dart';
import 'package:worker_app/screens/withdraw_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await UserPreferencesController().intSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/welcome_screen',
      routes: {

        '/welcome_screen' : (context) => WelcomeScreen(),
        '/MyHomePage' : (context) => MyHomePage("title"),
        '/onboard' : (context) => Onboard(),
        '/user_screen' : (context) => UserScreen(),
        '/service_screen' : (context) => ServiceScreen(),
        '/orders_screen' : (context) => OrdersScreen(),
        '/more_screen' : (context) => MoreScreen(),
        '/main_screen' : (context) => MainScreen(),
        '/choice_card_screen' : (context) => ChoiceCardScreen(),
        '/card_info_screen' : (context) => CardInfoScreen(),
        '/withdraw_Select_screen' : (context) => WithdrawSelectScreen(),
        '/withdraw_screen' : (context) => WithdrawScreen(),
        '/successfully_screen' : (context) => SuccessfullyScreen(),
        '/getting_started_screen' : (context) => GettingStartedScreen(),
        '/about_app_screen' : (context) => AboutAppScreen(),
        '/setting_screen' : (context) => SettingScreen(),
        '/fqa_screen' : (context) => FQAScreen(),
        '/card_info_filled_screen' : (context) => CardInfoFilledScreen(),
        '/login_service_screen' : (context) => LoginServiceScreen(),
        '/register_service_screen' : (context) => RegisterServiceScreen(),
      },
    );
  }


}

