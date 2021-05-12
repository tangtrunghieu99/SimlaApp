import 'package:animate_do/animate_do.dart';
import 'package:figure_app/constants/constants_details.dart';
import 'package:figure_app/containmain.dart';
import 'package:figure_app/firebase/order_fb.dart';
import 'package:figure_app/handle/food_handle.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:figure_app/screen/widgets/order_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:figure_app/constants/colors.dart';
import 'package:figure_app/models/order_model.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';
import 'main_home.dart';

String quantity = "1";
String total = "123456";
int sl;
class CartPage extends StatefulWidget {
  List<OrderModel> lstO;
  CartPage(this.lstO);
  @override
  _CartPageState createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  void tong() {
    double t = 0.0;
    for (int i = 0; i < widget.lstO.length; i++) {
      double tp = double.parse(widget.lstO[i].price) *
          double.parse(widget.lstO[i].quantity);
      print(tp);
      t += tp;
    }
    total = t.toString();
  }

  @override
  Widget build(BuildContext context) {
    tong();
    lstOD =widget.lstO;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          title: Text("Giỏ hàng của bạn" , style: TextStyle(color: Colors.black),),
          
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  // imageCache.clear();
                  return MainHome();
                }));
              })),
      body: widget.lstO.length > 0 ? getBody() : Center(child: Text("Bạn chưa có sản phẩm vào giỏ hàng")),
    );
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
          child: Text(
            "Các sản phẩm",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        Column(
          children: List.generate(widget.lstO.length, (index) {
            return FadeInDown(
              duration: Duration(milliseconds: 350 * index),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: grey,
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.5,
                                color: black.withOpacity(0.1),
                                blurRadius: 1)
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10, left: 25, right: 25, bottom: 25),
                        child: Column(
                          children: <Widget>[
                            Center(
                              child: Container(
                                width: 120,
                                height: 70,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            widget.lstO[index].img),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.lstO[index].nameFood,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              widget.lstO[index].price,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "x" + widget.lstO[index].quantity,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        SizedBox(height:12.0),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: ()
                              {
                                sl = int.parse(widget.lstO[index].quantity);
                                sl = processCounter(sl,1);
                                
                                setState(() {
                                  quantity = sl.toString();
                                  FigleHandle.updateQuantity(widget.lstO, sl, widget.lstO[index].foodID);
                                });
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.red[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.linear_scale_rounded,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                widget.lstO[index].quantity,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height:12.0),
                            GestureDetector(
                              onTap: ()
                              {
                                sl = int.parse(widget.lstO[index].quantity);
                                sl = processCounter(sl,0);
                                
                                setState(() {
                                  quantity = sl.toString();
                                  FigleHandle.updateQuantity(widget.lstO, sl, widget.lstO[index].foodID);
                                });
                              },
                              child: Container(
                                width: 20.0,
                                height: 20.0,
                                decoration: BoxDecoration(
                                  color: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            );
          }),
        ),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Tổng tiền",
                style: TextStyle(
                    fontSize: 22,
                    color: black.withOpacity(0.5),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                total,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: kPrimaryColor,
              onPressed: () {},
              child: GestureDetector(
                onTap: ()
                {
                  //  DateTime dt = DateTime.now();
                  //   DateFormat fm =   DateFormat('HH:mm:ss dd-MM-yyyy');
                  //  String date = fm.format(dt);
                  //  String code = "HHM" + dt.millisecondsSinceEpoch.toString();
                  // if (OrderFirebase.upOrder(widget.lstO, date, acc.id, "1","0", total.toString(),code) ==  true)
                  //  {
                  //    lstOD = [];
                  //     Navigator.push(context, MaterialPageRoute(
                  //       builder: (context)
                  //       {
                  //         return MainHome();
                  //       }
                  //     ));
                  //  }

                  Navigator.push(context, MaterialPageRoute(
                        builder: (context)
                        {
                          return OrderConfirm(widget.lstO,total);
                        }
                      ));
                },
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      "Thanh toán",
                      style: TextStyle(
                          color: white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }



int processCounter(int sl,int congtru)
{
  if(congtru == 0)
  {
    sl++;
  }
  else
  {
    if(sl > 1)
      sl--;
  }
  return sl;
}
}