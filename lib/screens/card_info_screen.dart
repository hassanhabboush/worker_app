import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/api/api_settings.dart';
import 'package:worker_app/api/controllers/create_rder_api_controller.dart';
import 'package:worker_app/screens/card_info_filled_screen.dart';
import 'package:http/http.dart' as http;

import 'package:worker_app/utils/helpers.dart';

class CardInfoScreen extends StatefulWidget {
  const CardInfoScreen({Key? key}) : super(key: key);

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> with Helpers {
  PhoneNumber? _phoneNumber;

  late TextEditingController _phoneEditingController;
  late TextEditingController _detailsAddressEditingController;
  String detailsProblem  ="";
  String phone ="";
  String details ="";
  String path = "";
  String nameWork ="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    _phoneEditingController = TextEditingController();
    _detailsAddressEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _phoneEditingController.dispose();
    _detailsAddressEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(phone);
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
                                "Location",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
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
                SizedBox(height: 43),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _detailsAddressEditingController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff0E4DFB),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: "More Details About Problem …...",
                      hintStyle:
                          TextStyle(color: Color(0xffC2CECE), fontSize: 14),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff0E4DFB),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onChanged: (value) async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.setString('detailsProblem', value);
                      setState(() {
                        print(value);
                      });
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2.0,
                          blurRadius: 5.0,
                          offset: Offset(0, 3), // التحكم في اتجاه ومقدار الظل
                        ),
                      ],
                      border: Border.all(
                        color: Color(0xff6236FF),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: InternationalPhoneNumberInput(
                      textFieldController: _phoneEditingController,
                      inputDecoration: InputDecoration(
                        label: Text(
                          '5000|',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff0E4DFB),
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        // hintText: '',
                        hintTextDirection: TextDirection.ltr,
                        // hintStyle: TextStyle(color: Color(0xff0E4DFB),fontSize: 16,fontWeight: FontWeight.w500),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 16.0,
                        ),
                      ),
                      onInputChanged: (PhoneNumber? number) async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setString('phone', number.toString());
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
                      initialValue: PhoneNumber(isoCode: 'SA'),
                    ),
                  ),
                ),
                Text("nameWork: ${nameWork}"),
                Text("path: ${path}"),
                Text("details: ${details}"),
                Text("detailsProblem: ${detailsProblem}"),
                Text("phone: ${phone}"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 35),
          child: ElevatedButton(
            onPressed: () {
              performData();
            },
            child: Text(
              'Add Order',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 55),
              backgroundColor: Color(0xff222328),
              shadowColor: Color(0xffE9C75E),
            ),
          ),
        ),
        elevation: 0,
        color: Colors.transparent,
      ),
    );
  }

  void getData() async {
    final sahPref = await SharedPreferences.getInstance();
    setState(() {
      nameWork = sahPref.getString('nameWork')!;
      path = sahPref.getString('path')!;
      details = sahPref.getString('details')!;
      detailsProblem = sahPref.getString('detailsProblem')!;
      phone = sahPref.getString('phone')!;
    });
  }

  Future<void> performData() async {
    if (checkData()) {
      postData();
    }
  }

  bool checkData() {
    if (_phoneEditingController.text.isNotEmpty &&
        _detailsAddressEditingController.text.isNotEmpty) {
      return true;
    }
    showSnakeBar(context: context, message: 'Enter required data', error: true);
    return false;
  }

  // Future<void> saveData() async {
  //   bool status = await CreateOrderApiController().addOrder(
  //     context: context,
  //     details: "details",
  //     detailsAddress: "detailsProblem",
  //     phone: "phone",
  //     photo: "path",
  //     work_id: "nameWork",
  //     long: '1221',
  //     lat: '1222',
  //   );
  //
  //   if (status) {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => CardInfoFilledScreen(),
  //         ));
  //   } else {
  //     showSnakeBar(
  //         context: context, message: 'Login failed, try again', error: true);
  //   }
  // }




  void postData() async {
    var url = Uri.parse(ApiSettings.CREATEORDER) ; // استبدل بURL الخاص بAPI الذي تريد الاتصال به
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'details': details, // استبدل بالبيانات التي تريد إرسالها
        'details_address': detailsProblem,
      }),
    );

    if (response.statusCode == 200) {
      print('Success: ${response.body}');
    } else {
      print('Error: ${response.statusCode}');
    }
  }

}
