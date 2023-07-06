import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worker_app/api/controllers/allWorks_api_controller.dart';
import 'package:worker_app/models/allWorks.dart';
import 'package:worker_app/screens/choice_card_screen.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  List<AllWorks> _allWorks = <AllWorks>[];
  late Future<List<AllWorks>> _future;

  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = AllWorksApiController().getAllWorks();
    saveData(name);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 270,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.png'),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 44),
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('assets/images/service.png'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.3,
                    ),
                    Container(
                      height: 87,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40, right: 19),
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none_sharp,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Select Service',
              style: TextStyle(
                color: Color(0xff0E4DFB),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: FutureBuilder<List<AllWorks>>(
                  future: _future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                      _allWorks = snapshot.data!; // حل (1)
                      // _categories = snapshot.data ?? [];// حل (2)
                      return GridView.builder(
                        itemCount: _allWorks.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 29,
                          mainAxisSpacing: 12,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 86,
                            width: 93,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffDE1487),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChoiceCardScreen(),
                                        ));
                                  },
                                  icon: Icon(Icons.error),
                                  // _allWorks[index].icon != null
                                  //     ? Image.network(_allWorks[index].icon)
                                  //     : Icon(Icons.error),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  name = _allWorks[index].name,
                                  style: TextStyle(
                                      color: Color(0xff0E4DFB), fontSize: 10),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return Column(
                        children: [
                          Icon(
                            Icons.warning,
                            size: 80,
                          ),
                          Text(
                            'No Data',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveData(String val) async {
    final sahPref = await SharedPreferences.getInstance();
    sahPref.setString('nameWork', val);
    getData();
  }

  void getData() async {
    final sahPref = await SharedPreferences.getInstance();
    setState(() {
      name = sahPref.getString('nameWork')!;
    });
  }
}

// ListView.builder(
// itemCount: _categories.length,
// itemBuilder: (context, index) {
// return ListTile(
// leading: Icon(Icons.category),
// title: Text(_categories[index].title),
// subtitle: Text(_categories[index].productsCount.toString()),
// );
// },
// );
