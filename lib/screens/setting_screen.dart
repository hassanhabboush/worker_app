import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/utils/helpers.dart';

File? imageFile;
String? imgPath;

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> with Helpers {

  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  String? _errorName;
  String? _errorEmail;
  PhoneNumber? _phoneNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:

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
                                'Setting',
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
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _nameTextController,
                    onChanged: (String value) {
                      print('valu: $value');
                    },
                    obscureText: true,
                    keyboardType: TextInputType
                        .visiblePassword,
                    style: TextStyle(
                        color: Color(0xffC2CECE)),
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 21.5),
                      labelText: 'Full Name',
                      alignLabelWithHint: true,
                      errorText: _errorName,
                      errorBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                10.0)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                10.0)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      helperMaxLines: 2,
                      helperStyle: TextStyle(
                          color: Colors.blue),
                      // prefixIcon: Icon(Icons.lock),
                      enabledBorder:
                      OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                          Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                          Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller:
                    _emailTextController,
                    onChanged: (String value) {
                      print('valu: $value');
                    },
                    obscureText: false,
                    keyboardType:
                    TextInputType.emailAddress,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding:
                      EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 21.5),
                      labelText: 'Email',
                      hintText: 'Android@gmail.com',
                      hintStyle: TextStyle(
                        color: Color(0xffC2CECE),
                      ),
                      alignLabelWithHint: true,
                      errorText: _errorEmail,
                      errorBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                10.0)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      focusedErrorBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                10.0)),
                        borderSide: BorderSide(
                          width: 1,
                        ),
                      ),
                      helperMaxLines: 2,
                      helperStyle: TextStyle(
                          color: Colors.blue),
                      // prefixIcon: Icon(Icons.lock),
                      enabledBorder:
                      OutlineInputBorder(
                        // borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                          Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder:
                      OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            10),
                        borderSide: BorderSide(
                          width: 1,
                          color:
                          Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: InternationalPhoneNumberInput(
                    textFieldController: _phoneTextController,
                    inputDecoration:
                    InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffAF8344))
                      ),
                      label: Text(
                        '5000|',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color:
                            Color(0xffAF8344),
                            fontSize: 16,
                            fontWeight:
                            FontWeight.w500),
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
                ),

                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff0E4DFB),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: InkWell(
                      onTap: () async => getImage(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  backgroundImage: imgPath != null
                                      ? FileImage(File(imgPath!))
                                  as ImageProvider<Object>
                                      : AssetImage('assets/images/profile.png')
                                  as ImageProvider<
                                      Object>, // replace with your default image path
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Image Problem',
                            style: TextStyle(
                              color: Color(0xff272727),
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19.0),
                  child: Text(
                    'image must be no more than 2 MB Max 5 Image',
                    style: TextStyle(color: Color(0xff7F8FA6), fontSize: 11),
                  ),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/card_info_screen');
                    },
                    child: Text('save ',style: TextStyle(fontSize: 15,color: Colors.white),),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff272727),
                      minimumSize: Size(double.infinity, 40)
                    ),
                  ),
                ),
              ],
            ),



      ),
      // bottomNavigationBar:


    );
  }

  void getImage() async {
    final pickerImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      saveData(pickerImage.path.toString());
      setState(() {
        imageFile = File(pickerImage.path);
      });
    }


  }

  void saveData(String val) async {
    final sahPref = await SharedPreferences.getInstance();
    sahPref.setString('path', val);
  }
}
