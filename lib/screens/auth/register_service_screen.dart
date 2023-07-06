import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:worker_app/api/controllers/users_api_controller.dart';
import 'package:worker_app/models/addresses.dart';
import 'package:worker_app/prefs/user_preferences_controller.dart';
import 'package:worker_app/screens/auth/login_service_screen.dart';
import 'package:worker_app/utils/helpers.dart';

class RegisterServiceScreen extends StatefulWidget {
  const RegisterServiceScreen({Key? key}) : super(key: key);

  @override
  State<RegisterServiceScreen> createState() => _RegisterServiceScreenState();
}

class _RegisterServiceScreenState extends State<RegisterServiceScreen>
    with SingleTickerProviderStateMixin, Helpers {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  PhoneNumber? _phoneNumber;
  bool _obscurePassword = true;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  String? _errorName;
  String? _errorEmail;
  String? _errorPassword;
  bool isChecked = false;
  bool isDisabled = false;
  MSHCheckboxStyle style = MSHCheckboxStyle.stroke;

  late TabController _tabController;

  int _tabIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _nameTextController.dispose();
    _emailTextController.dispose();
    _phoneTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff6FC8FB),
                    Color(0xff346EDF),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 46),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 12.0),
                  child: Container(
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
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 41.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ListView(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                          children: [
                            SizedBox(height: 15),
                            TabBar(
                              indicatorWeight: 5.0,
                              indicatorSize: TabBarIndicatorSize.label,
                              // جعل طول الخط يمتد عبر عرض التابات

                              indicator: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0E4DFB), // لون الخط
                                    width: 2.0, // سمك الخط
                                  ),
                                ),
                              ),
                              controller: _tabController,
                              labelColor: Colors.blue,
                              unselectedLabelColor: Color(0xff646781),
                              onTap: (int value) {
                                setState(() {
                                  _tabIndex = value;
                                });
                              },
                              tabs: [
                                Tab(
                                  text: 'Service provider',
                                ),
                                Tab(
                                  text: 'Customer',
                                ),
                              ],
                            ),
                            IndexedStack(
                              // هي عبارة عن اسلوب لاظهار العناصر داخل lisView ضمن موضع رقمي معين بدلا عن tabBarView في هذه الحالة
                              index: _tabIndex,
                              children: [
                                // Container(
                                //   child: Text('SIGN IN'),
                                // ),
                                Visibility(
                                  visible: _tabIndex == 0,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 47),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2.0,
                                                    blurRadius: 5.0,
                                                    offset: Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color: Color(0xff6236FF),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
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
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2.0,
                                                    blurRadius: 5.0,
                                                    offset: Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color: Color(0xff6236FF),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
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
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2.0,
                                                    blurRadius: 5.0,
                                                    offset: Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color: Color(0xff6236FF),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child:
                                                  InternationalPhoneNumberInput(
                                                    textFieldController: _phoneTextController,
                                                inputDecoration:
                                                    InputDecoration(
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
                                            SizedBox(height: 11.0),
                                            Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 2.0,
                                                    blurRadius: 5.0,
                                                    offset: Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color: Color(0xff6236FF),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: TextField(
                                                controller:
                                                    _passwordTextController,
                                                onChanged: (String value) {
                                                  print('valu: $value');
                                                },
                                                obscureText: _obscurePassword,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xffC2CECE)),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 10,
                                                          horizontal: 21.5),
                                                  label: Container(
                                                    alignment: Alignment.center,
                                                    // width: double.infinity,
                                                    child: Text(
                                                      '*******',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color:
                                                              Color(0xff7F8FA6),
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  // hintText: '***********',
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(_obscurePassword
                                                        ? Icons.visibility
                                                        : Icons.visibility_off),
                                                    onPressed: () {
                                                      setState(() {
                                                        _obscurePassword =
                                                            !_obscurePassword;
                                                      });
                                                    },
                                                  ),
                                                  alignLabelWithHint: true,
                                                  errorText: _errorPassword,
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
                                            const SizedBox(height: 37.5),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    MSHCheckbox(
                                                      size: 23,
                                                      value: isChecked,
                                                      isDisabled: isDisabled,
                                                      colorConfig: MSHColorConfig
                                                          .fromCheckedUncheckedDisabled(
                                                        checkedColor:
                                                            Color(0xff0E4DFB),
                                                      ),
                                                      style: style,
                                                      onChanged: (selected) {
                                                        setState(() {
                                                          isChecked = selected;
                                                        });
                                                      },
                                                    ),
                                                    SizedBox(width: 10),
                                                    Text('I Read and Accept ',
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff272727))),
                                                  ],
                                                ),
                                                Text(
                                                  'Home Service Terms & Conditions',
                                                  style: TextStyle(
                                                      fontSize: 9,
                                                      color: Color(0xff0E4DFB)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 41.5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('New Member?',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff272727))),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pushReplacement(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) =>
                                                                  LoginServiceScreen(),
                                                            ));
                                                      },
                                                      child: Text(
                                                        'SIGN IN',
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xff0E4DFB),
                                                          decorationStyle:
                                                              TextDecorationStyle
                                                                  .solid,
                                                          decorationColor:
                                                              Color(0xff0E4DFB),
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  height: 55,
                                                  width: 164,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    gradient: LinearGradient(
                                                      begin:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      end: AlignmentDirectional
                                                          .centerEnd,
                                                      colors: [
                                                        Color(0xff346EDF),
                                                        Color(0xff6FC8FB),
                                                      ],
                                                    ),
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      performRegister();
                                                    },
                                                    child: Text('SIGN UP'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      // minimumSize: Size(double.infinity, 50),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: _tabIndex == 1,
                                  child: Container(
                                    child: Text('SIGN UP'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> performRegister() async {
   if(checkData()){
     register();
   }
  }

  bool checkData() {
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _phoneTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;

    }
    showSnakeBar(context: context, message: 'Enter required data', error: true);
    return false;
  }

  Future<void> register() async {
    bool status = await UsersApiController().register(
        context: context,
        name: _nameTextController.text,
        email: _emailTextController.text,
        password: _passwordTextController.text,
        phone: _phoneTextController.text);
  
    if (status) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginServiceScreen(),
          ));
    } else {
      showSnakeBar(
          context: context, message: 'Login failed, try again', error: true);
    }
  }
}

// ElevatedButton(
// onPressed: () {
// if (_formKey.currentState
//     ?.validate() ??
// false) {
// print(
// 'Phone Number: ${_phoneNumber?.phoneNumber}');
// print(
// 'Country Code: ${_phoneNumber?.dialCode}'); // استخدم selectedCountryCode بدلاً من countryCode
// }
// },
// child: Text('Submit'),
// ),
