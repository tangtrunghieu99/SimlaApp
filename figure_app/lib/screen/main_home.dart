import 'package:figure_app/containmain.dart';
import 'package:figure_app/screen/cart.dart';
import 'package:figure_app/screen/widgets/bam.dart';
import 'package:figure_app/screen/widgets/favourite_screen.dart';
import 'package:figure_app/screen/widgets/orderstatus_screen.dart';
import 'package:figure_app/screen/widgets/profile_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'order.dart';



// Tạo 4 file dart , cái home có rồi thì khỏi
HomeScreen _home; // cái này là Home_Screen
OrderStatusScreen _order; // Nhớ viết gì đó trong mấy file dart để nhận biết
CartPage _cart;
ProfileScreen _profile;

class MainHome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return MainHomeState();
  }
}

class MainHomeState extends State<MainHome>
{

  int _currentTabIndex = 0;
  Widget _currentPage;
  List<Widget> pages;


  @override
  void initState() {
    _home = HomeScreen();
   _order = OrderStatusScreen();
    _cart = CartPage(lstOD);
    _profile = ProfileScreen();
    pages = [_home,_order,_cart,_profile];
    _currentPage = _home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
          setState(() {
            _currentTabIndex = index;
            _currentPage = pages[index];
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTabIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: "Trang chủ"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping_rounded,color: Colors.grey),
            label: "Đơn hàng"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,color: Colors.grey),
            label: "Giỏ hàng"
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.person,color: Colors.grey),
            label: "Cá nhân"
          ),
        ],
      ),
      body: _currentPage,
    );
  }
}