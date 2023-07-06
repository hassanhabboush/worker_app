
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:worker_app/api/controllers/unComplete_api_controller.dart';
import 'package:worker_app/models/unComplete_order.dart';
import 'package:worker_app/utils/helpers.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin ,Helpers {
  late TabController _tabController;
  List<UnCompleteOrder> _unComplete = <UnCompleteOrder>[];
  late Future<List<UnCompleteOrder>> _future;

  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    print(_unComplete.length);
    _tabController = TabController(length: 3, vsync: this);
    _future = UnCompleteApiController().getUnCompleteOrder();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAEFFF),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text('Item Details'),
            backgroundColor: Color(0xff6FC8FB),
            expandedHeight: 100,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color(0xff6FC8FB),
                      Color(0xff0E4DFB),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 52,
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.blue,
                indicatorWeight: 2.0,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                onTap: (int value) {
                  setState(() {
                    _tabIndex = value;
                  });
                },
                tabs: [
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Underway',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: IndexedStack(
              index: _tabIndex,
              children: [
                Visibility(
                  visible: _tabIndex == 0,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/withdraw_Select_screen');
                        },
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                          child: Container(
                            height: 106.39,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff000000),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order #52001',
                                        style: TextStyle(
                                            color: Color(0xff272727),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '28 Nov 2019',
                                        style: TextStyle(
                                            color: Color(0xff7F8FA6),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Text(
                                    'Service Type : Carpenter',
                                    style: TextStyle(
                                        color: Color(0xff0E4DFB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: _tabIndex == 1,
                  child:  FutureBuilder<List<UnCompleteOrder>>(
                    future: _future,
                    builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // showSnakeBar(context: context, message: 'false',error: true);
                        return Center(child: CircularProgressIndicator());

                      } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        _unComplete = snapshot.data!;

                        showSnakeBar(context: context, message: _unComplete.length.toString(),error: false);
                        return ListView.builder(
                          itemCount: _unComplete.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                                  child: Container(
                                    height: 106.39,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xff000000),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                // "Order: ${_unComplete[index].id}",
                                                "fgdfgf",
                                                style: TextStyle(
                                                    color: Color(0xff272727),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              Text(
                                               ' _unComplete[index].createdAt',
                                                style: TextStyle(
                                                    color: Color(0xff7F8FA6),
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 28,
                                          ),
                                          Text(
                                            'Service Type :{_unComplete[index].work.name}',
                                            style: TextStyle(
                                                color: Color(0xff0E4DFB),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                          ),
                        );
                      }
                    },
                  ),

                ),
                Visibility(
                  visible: _tabIndex == 2,
                  child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/withdraw_Select_screen');
                        },
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 3),
                          child: Container(
                            height: 106.39,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff000000),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Order #52001',
                                        style: TextStyle(
                                            color: Color(0xff272727),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        '28 Nov 2019',
                                        style: TextStyle(
                                            color: Color(0xff7F8FA6),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 28,
                                  ),
                                  Text(
                                    'Service Type : Carpenter',
                                    style: TextStyle(
                                        color: Color(0xff0E4DFB),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

