  
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

class Order extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}
class OrderState extends State<Order>
{
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Text("Order"),
      )
    );
  } 
}