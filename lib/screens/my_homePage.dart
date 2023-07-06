import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:worker_app/api/controllers/create_rder_api_controller.dart';
import 'package:worker_app/utils/helpers.dart';


/////////////////////////////////////////////////////////////////////////////
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage(this.title);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with Helpers {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    nameController = TextEditingController();
    jobController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Name here'),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Job here'),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                    onPressed: ()  {
                      String details = nameController.text;
                      String detailsAddress = jobController.text;
                       data(work_id: "1",
                          details: details,
                          detailsAddress: detailsAddress,
                          long: "123",
                          lat: "123",
                          phone: "1234567899",
                          photo: "https://studentucas.awamr.com/assets/images/orderPhotos/cLIRjGba01CeBOt6wET0nFYcqcX5FHrl7EsSsHDd.jpg");
                    },
                    child: Text('Sumbit')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> data({
    required String work_id,
    required String details,
    required String detailsAddress,
    required String long,
    required String lat,
    required String phone,
    required String photo,

  }) async {
    bool status = await CreateOrderApiController().addOrder(
        context: context,
        work_id: work_id,
        details: details,
        detailsAddress: detailsAddress,
        long: long,
        lat: lat,
        phone: phone,
        photo: photo
    );

    if (status) {
      showSnakeBar(
          context: context, message: 'true', error: false);
    } else {
      showSnakeBar(
          context: context, message: 'false', error: true);
    }
  }
}

/////////////////////////////////////////////////////////////////////////////

//مثال للرفع باستخدام api
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class AddOrderScreen extends StatefulWidget {
//   @override
//   _AddOrderScreenState createState() => _AddOrderScreenState();
// }
//
// class _AddOrderScreenState extends State<AddOrderScreen> {
//   TextEditingController _detailsController = TextEditingController();
//
//   Future<bool> addOrderCard(String details) async {
//     var url = Uri.parse('https://studentucas.awamr.com/api/create/order');
//     var response = await http.post(url, body: {
//       'details': details,
//     });
//
//     if (response.statusCode == 200) {
//       var responseData = jsonDecode(response.body);
//       String message = responseData['message'];
//       print("Response Message: $message");
//       return true;
//     } else if (response.statusCode == 400) {
//       var responseData = jsonDecode(response.body);
//       String errorMessage = responseData['message'];
//       print("Error Message: $errorMessage");
//     }
//
//     return false;
//   }
//
//   void _submitOrder() {
//     String details = _detailsController.text;
//     addOrderCard(details).then((success) {
//       if (success) {
//         // تم رفع الطلب بنجاح
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Success'),
//               content: Text('تم رفع الطلب بنجاح'),
//               actions: [
//                 TextButton(
//                   child: Text('موافق'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         // فشل في رفع الطلب
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('فشل في رفع الطلب'),
//               actions: [
//                 TextButton(
//                   child: Text('موافق'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('إضافة طلب جديد'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _detailsController,
//               decoration: InputDecoration(
//                 labelText: 'التفاصيل',
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _submitOrder,
//               child: Text('إرسال الطلب'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: AddOrderScreen(),
//   ));
// }

/////////////////////////////////////////////////////////////////////////////
// هذا مثال اخر
// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Geocoding Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   GoogleMapController? _mapController;
//   LatLng? _selectedLocation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Geocoding Example'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: (controller) {
//                 _mapController = controller;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(37.7749, -122.4194), // تحديد الموقع الابتدائي للخريطة
//                 zoom: 12.0, // التكبير الابتدائي للخريطة
//               ),
//               markers: _selectedLocation != null
//                   ? Set<Marker>.of([
//                 Marker(
//                   markerId: MarkerId('selected_location'),
//                   position: _selectedLocation!,
//                 ),
//               ])
//                   : Set<Marker>(),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () {
//               convertAddressToLatLng('1600 Amphitheatre Parkway, Mountain View, CA');
//             },
//             child: Text('Convert Address to LatLng'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void convertAddressToLatLng(String address) async {
//     try {
//       List<Location> locations = await locationFromAddress(address);
//       if (locations.isNotEmpty) {
//         Location location = locations.first;
//         setState(() {
//           _selectedLocation = LatLng(location.latitude!, location.longitude!);
//           _mapController!.animateCamera(CameraUpdate.newLatLng(_selectedLocation!));
//         });
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('No coordinates found for the address.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           ),
//         );
//       }
//     } catch (e) {
//       print('Error: $e');
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Error'),
//           content: Text('An error occurred while converting address to LatLng.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

///////////////////////////////////////////////////////////////////////////////
// مثال سابق

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome Video',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: VideoScreen(),
//     );
//   }
// }
//
//
// class VideoScreen extends StatefulWidget {
//   @override
//   _VideoScreenState createState() => _VideoScreenState();
// }
//
// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.asset('assets/videos/welcome_video.mp4')
//       ..initialize().then((_) {
//         setState(() {});
//       });
//     _chewieController = ChewieController(
//       videoPlayerController: _controller,
//       aspectRatio: 2 / 2, // تعيين نسبة العرض إلى الارتفاع المطلوبة
//       autoInitialize: true,
//       autoPlay: true,
//       looping: true,
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//     _chewieController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Screen'),
//       ),
//       body: Center(
//         child: _controller.value.isInitialized
//             ? AspectRatio(
//           aspectRatio: _controller.value.aspectRatio,
//           child: Chewie(controller: _chewieController),
//         )
//             : CircularProgressIndicator(),
//       ),
//     );
//   }
// }
///////////////////////////////////////////////////////////////////////////////
//مثال سابق
// import 'package:flutter/material.dart';
// import 'package:msh_checkbox/msh_checkbox.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   bool isChecked = false;
//   bool isDisabled = false;
//   MSHCheckboxStyle style = MSHCheckboxStyle.stroke;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MSHCheckbox Example',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(title: const Text('MSHCheckbox Example')),
//         body: Column(
//           children: [
//             Expanded(
//               child: Center(
//                 child: MSHCheckbox(
//                   size: 100,
//                   value: isChecked,
//                   isDisabled: isDisabled,
//                   colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
//                     checkedColor: Colors.blue,
//                   ),
//                   style: style,
//                   onChanged: (selected) {
//                     setState(() {
//                       isChecked = selected;
//                     });
//                   },
//                 ),
//               ),
//             ),
// Container(
//   height: 150,
//   color: Colors.blue,
//   child: Center(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         // control(
//         //   "Disabled",
//         //   Switch(
//         //     value: isDisabled,
//         //     activeColor: Colors.white,
//         //     onChanged: (value) => setState(() {
//         //       isDisabled = value;
//         //     }),
//         //   ),
//         // ),
//         // control(
//         //   "Style",
//         //   Padding(
//         //     padding: const EdgeInsets.only(top: 8.0),
//         //     child: Container(
//         //       decoration: BoxDecoration(
//         //         color: Colors.white,
//         //         borderRadius: BorderRadius.circular(4),
//         //       ),
//         //       // child: Padding(
//         //       //   padding:
//         //       //   const EdgeInsets.symmetric(horizontal: 8.0),
//         //       //   child: DropdownButton<MSHCheckboxStyle>(
//         //       //     isDense: true,
//         //       //     iconEnabledColor: Colors.grey,
//         //       //     dropdownColor: Colors.white,
//         //       //     underline: Container(),
//         //       //     // items: MSHCheckboxStyle.values
//         //       //     //     .map(
//         //       //     //       (style) => DropdownMenuItem(
//         //       //     //     value: style,
//         //       //     //     // child: Text(
//         //       //     //     //   style.name(),
//         //       //     //     // ),
//         //       //     //   ),
//         //       //     // )
//         //       //         .toList(),
//         //       //     value: style,
//         //       //     onChanged: (style) => setState(() {
//         //       //       if (style != null) {
//         //       //         this.style = style;
//         //       //       }
//         //       //     }),
//         //       //   ),
//         //       // ),
//         //     ),
//         //   ),
//         // ),
//       ],
//     ),
//   ),
// ),
//         ],
//       ),
//     ),
//   );
// }

//   Widget control(String title, Widget control) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         control,
//       ],
//     );
//   }
// }
//
// extension _StyleName on MSHCheckboxStyle {
//   String name() {
//     switch (this) {
//       case MSHCheckboxStyle.stroke:
//         return "Stroke";
//       case MSHCheckboxStyle.fillScaleColor:
//         return "Scale Color";
//       case MSHCheckboxStyle.fillScaleCheck:
//         return "Scale Check";
//       case MSHCheckboxStyle.fillFade:
//         return "Fade";
//     }
//   }
// }
//

///////////////////////////////////////////////////////////////////////////////
//مثال سابق

// import 'package:flutter/material.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Phone Number Input Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PhoneNumberInputPage(),
//     );
//   }
// }
//
// class PhoneNumberInputPage extends StatefulWidget {
//   @override
//   _PhoneNumberInputPageState createState() => _PhoneNumberInputPageState();
// }
//
// class _PhoneNumberInputPageState extends State<PhoneNumberInputPage> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   PhoneNumber? _phoneNumber;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Number Input Demo'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               InternationalPhoneNumberInput(
//                 onInputChanged: (PhoneNumber? number) {
//                   setState(() {
//                     _phoneNumber = number;
//                   });
//                 },
//                 selectorConfig: SelectorConfig(
//                   selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     print('Phone Number: ${_phoneNumber?.phoneNumber}');
//                     print('Country Code: ${_phoneNumber?.dialCode}'); // استخدم selectedCountryCode بدلاً من countryCode
//                   }
//                 },
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
