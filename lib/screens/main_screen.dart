import 'package:flutter/material.dart';
import 'package:worker_app/models/bn_screen.dart';
import 'package:worker_app/screens/more_screen.dart';
import 'package:worker_app/screens/user_screen.dart';
import 'package:worker_app/screens/orders_screen.dart';
import 'package:worker_app/screens/service_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  final List<BnScreen> _bnScreen =<BnScreen>[
    const BnScreen(widget: ServiceScreen(), title: 'Service'),
    const BnScreen(widget: OrdersScreen(), title: 'Orders'),
    const BnScreen(widget: UserScreen(), title: 'User'),
    const BnScreen(widget: MoreScreen(), title: 'More'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bnScreen[_selectedIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          // يعملعند الضغط على tap
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        //...3 , تعمل بناءا على Index يعني 0 ,2
        showSelectedLabels: true,
        // هنا تتحكم ب ظهور label
        showUnselectedLabels: true,
        // يوجد فيها انيميشن و أيضا تتحكم في ظهور label
        // fixedColor: Colors.red, //  خاصية تتحك في لون ال BottomNaviga المختار و نفس الاسفل
        selectedItemColor: Colors.white,
        //   selectedItemColor  اوfixedColor و توجد قاعدة اما تستخدم
        selectedIconTheme: IconThemeData(color: Colors.red),
        // فإن الذي يحصل  selectedItemColor توجد قاعدة عند استخدام selectedIconTheme و
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        selectedFontSize: 12,
        // خاصية تتحكم في حجم النص
        unselectedFontSize: 11,
        // خاصية تتحكم ب حجم النص الذي لم يحدد
        unselectedIconTheme: IconThemeData(color: Colors.black),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
        unselectedItemColor: Colors.grey.shade800,
        backgroundColor: Color(0xff6FC8FB),
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        // يعمل على تفعيل ظهور الخلفية لل BottomNavigationBar
        // iconSize: 25, //  خاصية تتحكم في حجم جميع الايقون بحجم واحد
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/service_bt.png'), // اذا كانت ليست مختارة تظهر هذه
            activeIcon: Image.asset('assets/images/service_bt.png'), // اذا كانت مختارة تظهر هذه
            label: 'Service',
            // backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/orders.png'),
            activeIcon: Image.asset('assets/images/orders.png'),
            label: 'Orders',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/users.png'),
            activeIcon: Image.asset('assets/images/users.png'),
            label: 'User',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/more.png'),
            activeIcon: Image.asset('assets/images/more.png'),
            label: 'More',
            // backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 270,
//                   width: double.infinity,
//                   child: Image(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/images/background.png'),
//                   ),
//                 ),
//                 Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 44),
//                       alignment: Alignment.topCenter,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image(
//                             image: AssetImage('assets/images/service.png'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 30.3,
//                     ),
//                     Container(
//                       height: 87,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 40, right: 19),
//                   alignment: Alignment.topRight,
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.notifications_none_sharp,
//                       size: 26,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Select Service',
//               style: TextStyle(
//                 color: Color(0xff0E4DFB),
//                 fontSize: 15,
//               ),
//             ),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: 5,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 2,
//                   mainAxisSpacing: 2,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     color: Colors.blue,
//                     child: Center(
//                       child: Text(
//                         'Item $index',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//

