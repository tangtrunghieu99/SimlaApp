import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:figure_app/constants.dart';
import 'package:figure_app/constants/colors.dart';
import 'package:figure_app/screen/login_signup.dart';
import 'package:figure_app/screen/home_screen.dart';
import 'package:figure_app/screen/widgets/bam.dart';
import 'package:figure_app/screen/widgets/change_password.dart';
import 'package:figure_app/screen/widgets/edit_profile.dart';
import 'package:figure_app/screen/widgets/favourite_screen.dart';
import 'package:figure_app/screen/widgets/mau.dart';
import 'package:figure_app/screen/widgets/order_confirm.dart';
import 'package:figure_app/screen/widgets/orderstatus_screen.dart';
import 'package:figure_app/screen/widgets/profile_screen.dart';
import 'package:figure_app/xu/test.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  
  // @override
  // Widget build(BuildContext context) {
  //   return ThemeProvider(
  //     initTheme: kDarkTheme,
  //     child:Builder( builder: 
  //       (context){
  //         return MaterialApp( 
  //           debugShowCheckedModeBanner: false,
  //           theme: ThemeProvider.of(context),
  //           home: ProfileScreen(),
  //         );
          
  //       }
  //     ,)
  //   );
    
  // }@override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SimLa Store",
      // theme: ThemeData(
        
      //   scaffoldBackgroundColor: Colors.white ,
      //   primaryColor: primaryColor,
      //   splashColor: Colors.transparent,
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      
      home: LoginSignupScreen(),
      //home: HomeScreen(),
      //home: ProfileScreen(),
      //home: OrderStatusScreen(),
      //home: EditProfile(),
      //home: Test(),
      //home: OrderConfirm(),
      //config:FavouriteScreen(),
    );
  }
}  