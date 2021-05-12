import 'package:flutter/material.dart';
import 'package:figure_app/screen/main_home.dart';

import '../../models/order_info.dart';
import '../home_screen.dart';
class OrderStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar( 
         title: Text("Đơn hàng của bạn", style: TextStyle(color: Colors.black),),
         centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        leading: IconButton( 
          icon: Icon(Icons.chevron_left,
                color: Colors.black,
                size: 30,),
          onPressed: () {
                Navigator.pop(context);
              }
        ),
      ), 
    body: SingleChildScrollView(
      child: Container(
        height: 800,
        child: ListView.builder(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              itemCount: lstOStatic.length,
              itemBuilder: (BuildContext context,int index)
                {
                  return GestureDetector(
                      onTap: ()
                  {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context)
                      {
                        return MainHome();
                      }
                      ));
                  },
                  child: _buildWidgetOrder(lstOStatic[index]),
                  );
                },
              ),
      ),
          
      ),
    
    );
  }

  Widget _buildWidgetOrder(OrderInfo o)
  {
    String sta = "Đang giao";
    if(o.status == "0")
    {
      sta = "Đang giao";
    }
    else
    {
      sta = "Đã giao";      
    }
    return Card(child:
        Row( 
          children: [ 
            Container( 
              
              width: 120,
              height: 160,
              
              color: Colors.white ,
              child: CircleAvatar(
                backgroundImage:AssetImage('assets/images/2.jpg'),
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child:Container( 
                height: 200,
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    Text(
                      "Mã vận đơn: " + o.code,
                      style: TextStyle(
                         color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Tình trạng: " + sta,
                      style: TextStyle(
                         color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "Tổng tiền: " + o.totalPrice + " VNĐ",
                      style: TextStyle(
                         color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
          );
  }
}