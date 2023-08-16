import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:worker_app/api/controllers/users_api_controller.dart';
import 'package:worker_app/screens/auth/register_service_screen.dart';
import 'package:worker_app/screens/service_screen.dart';
import 'package:worker_app/utils/helpers.dart';

class LoginServiceScreen extends StatefulWidget {
  const LoginServiceScreen({Key? key}) : super(key: key);

  @override
  State<LoginServiceScreen> createState() => _LoginServiceScreenState();
}

class _LoginServiceScreenState extends State<LoginServiceScreen>
    with Helpers, SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _phoneTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  // PhoneNumber? _phoneNumber;
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
    _phoneTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    _phoneTextController.dispose();
    _emailTextController.dispose();
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
              decoration: const BoxDecoration(
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
              children: [
                const SizedBox(height: 85),
                Image.asset(
                  'assets/images/layer2.png',
                  alignment: Alignment.centerRight,
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 39.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          children: [
                            const SizedBox(height: 15),
                            TabBar(
                              indicatorWeight: 5.0,
                              indicatorSize: TabBarIndicatorSize.label,
                              // جعل طول الخط يمتد عبر عرض التابات

                              indicator: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color(0xff0E4DFB), // لون الخط
                                    width: 2.0, // سمك الخط
                                  ),
                                ),
                              ),
                              controller: _tabController,
                              labelColor: Colors.blue,
                              unselectedLabelColor: const Color(0xff646781),
                              onTap: (int value) {
                                setState(() {
                                  _tabIndex = value;
                                });
                              },
                              tabs: const [
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
                                      const SizedBox(height: 47),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Container(
                                            //   height: 50,
                                            //   decoration: BoxDecoration(
                                            //     color: Colors.white,
                                            //     boxShadow: [
                                            //       BoxShadow(
                                            //         color: Colors.grey
                                            //             .withOpacity(0.5),
                                            //         spreadRadius: 2.0,
                                            //         blurRadius: 5.0,
                                            //         offset: Offset(0,
                                            //             3), // التحكم في اتجاه ومقدار الظل
                                            //       ),
                                            //     ],
                                            //     border: Border.all(
                                            //       color: Color(0xff6236FF),
                                            //       width: 0.5,
                                            //     ),
                                            //     borderRadius:
                                            //         BorderRadius.circular(5.0),
                                            //   ),
                                            //   child:
                                            //       InternationalPhoneNumberInput(
                                            //     textFieldController:
                                            //         _phoneTextController,
                                            //     inputDecoration:
                                            //         InputDecoration(
                                            //       label: Text(
                                            //         '5000|',
                                            //         textAlign: TextAlign.center,
                                            //         style: TextStyle(
                                            //             color:
                                            //                 Color(0xff0E4DFB),
                                            //             fontSize: 16,
                                            //             fontWeight:
                                            //                 FontWeight.w500),
                                            //       ),
                                            //       // hintText: '',
                                            //       hintTextDirection:
                                            //           TextDirection.ltr,
                                            //       // hintStyle: TextStyle(color: Color(0xff0E4DFB),fontSize: 16,fontWeight: FontWeight.w500),
                                            //       border: InputBorder.none,
                                            //       contentPadding:
                                            //           EdgeInsets.symmetric(
                                            //         vertical: 16.0,
                                            //         horizontal: 16.0,
                                            //       ),
                                            //     ),
                                            //     onInputChanged:
                                            //         (PhoneNumber? number) {
                                            //       setState(() {
                                            //         _phoneNumber = number;
                                            //       });
                                            //     },
                                            //     // selectorConfig: SelectorConfig(
                                            //     //   selectorType:
                                            //     //       PhoneInputSelectorType
                                            //     //           .DIALOG,
                                            //     // ),
                                            //     textStyle: TextStyle(
                                            //       fontSize: 16.0,
                                            //       color: Colors.black,
                                            //     ),
                                            //     initialValue:
                                            //         PhoneNumber(isoCode: 'SA'),
                                            //   ),
                                            // ),
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
                                                    offset: const Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff6236FF),
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
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10,
                                                          horizontal: 21.5),
                                                  labelText: 'Email',
                                                  hintText: 'Android@gmail.com',
                                                  hintStyle: const TextStyle(
                                                    color: Color(0xffC2CECE),
                                                  ),
                                                  alignLabelWithHint: true,
                                                  errorText: _errorEmail,
                                                  errorBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                  helperMaxLines: 2,
                                                  helperStyle: const TextStyle(
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
                                            const SizedBox(height: 32.0),
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
                                                    offset: const Offset(0,
                                                        3), // التحكم في اتجاه ومقدار الظل
                                                  ),
                                                ],
                                                border: Border.all(
                                                  color:
                                                      const Color(0xff6236FF),
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
                                                obscureText: true,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 10),
                                                  labelText: 'Password',
                                                  alignLabelWithHint: true,
                                                  errorText: _errorPassword,
                                                  errorBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                  focusedErrorBorder:
                                                      const OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.0)),
                                                    borderSide: BorderSide(
                                                      width: 1,
                                                    ),
                                                  ),
                                                  helperMaxLines: 2,
                                                  helperStyle: const TextStyle(
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
                                            const SizedBox(height: 41.5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                            const Color(
                                                                0xff0E4DFB),
                                                      ),
                                                      style: style,
                                                      onChanged: (selected) {
                                                        setState(() {
                                                          isChecked = selected;
                                                        });
                                                      },
                                                    ),
                                                    const SizedBox(width: 10),
                                                    const Text('Remember me',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                                0xff272727))),
                                                  ],
                                                ),
                                                const Text(
                                                  'Forgot Password?',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff272727)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 41.5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('New Member?',
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
                                                                  const RegisterServiceScreen(),
                                                            ));
                                                      },
                                                      child: const Text(
                                                        'SIGN UP',
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
                                                    gradient:
                                                        const LinearGradient(
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
                                                      performLogin();
                                                    },
                                                    child: const Text('LOGIN'),
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
                                            SizedBox(
                                              height: 150,
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: TextButton.icon(
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ServiceScreen(),
                                                        ));
                                                  },
                                                  icon: const Icon(
                                                      Icons.arrow_forward,
                                                      color: Color(0xff272727)),
                                                  label: const Text(
                                                    'Get Start Now',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Color(0xff272727)),
                                                  ),
                                                ),
                                              ),
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
                                    child: const Text('SIGN UP'),
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

  Future<void> performLogin() async {
    if (checkeData()) {
      login();
    }
  }

  bool checkeData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      Navigator.pushReplacementNamed(context, '/main_screen');
      showSnakeBar(
          context: context, message: 'تسجيل دخول المستخدم بنجاح', error: false);
      return true;
    }
    return false;
  }

  Future<void> login() async {
    bool status = await UsersApiController().login(
        email: _emailTextController.text,
        password: _passwordTextController.text);

    if (status) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/main_screen');
      showSnakeBar(
          context: context, message: 'تسجيل دخول المستخدم بنجاح', error: false);
    } else {
      // ignore: use_build_context_synchronously
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
