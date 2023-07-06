import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/utils/helpers.dart';
import 'package:http/http.dart' as http;

File? imageFile;
String? imgPath;

class ChoiceCardScreen extends StatefulWidget {
  const ChoiceCardScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceCardScreen> createState() => _ChoiceCardScreenState();
}

class _ChoiceCardScreenState extends State<ChoiceCardScreen> with Helpers {
  late ImagePicker _imagePicker;
  XFile? _pickedFile;
  String? name;

  TextEditingController _detailsEditingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getData();
    name;
    _textEditingController = TextEditingController();
    _detailsEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    _detailsEditingController.dispose();
    super.dispose();
  }

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
                                'Location',
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
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   alignment: Alignment.centerLeft,
                      //     image: AssetImage('assets/images/profile.png'),),
                      border: Border.all(
                        color: Color(0xff0E4DFB),
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
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
                SizedBox(height: 43),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _textEditingController,
                    maxLines: 5,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xff0E4DFB),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'More Details About Problem …...',
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
                      pref.setString('details', value);
                    },
                  ),
                ),
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
              Navigator.pushNamed(context, '/card_info_screen');
            },
            child: Text('Add Data'),
          ),
        ),
        elevation: 0,
        color: Colors.transparent,
      ),
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
    sahPref.setString('details', val);
    getData();
  }

  void getData() async {
    final sahPref = await SharedPreferences.getInstance();
    setState(() {
      imgPath = sahPref.getString('path');
      name=   sahPref.getString('details')!;
    });
  }





}
