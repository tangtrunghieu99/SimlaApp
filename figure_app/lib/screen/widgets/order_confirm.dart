import 'package:figure_app/constants/constants_details.dart';
import 'package:figure_app/firebase/order_fb.dart';
import 'package:figure_app/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../containmain.dart';
import '../main_home.dart';

String t;
class OrderConfirm extends StatefulWidget { 
  List<OrderModel> lstO;
  String total;
  OrderConfirm(this.lstO,this.total);
  @override
  State<StatefulWidget> createState() {
    return _OrderConfirmState();
  }
}

class _OrderConfirmState extends State<OrderConfirm> {
   

   @override
  void initState() {
    t = (double.parse(widget.total) + 1000.0 ).toString() ;
    super.initState();
 
  }
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar( 
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton( 
          icon: Icon( 
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0),
        child: Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[ 
            Text( 
              "Xác nhận đơn hàng",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
              ),
            ),
            SizedBox( height:18.0),
            cardItem(widget.lstO),
           
            SizedBox(height:30.0),
            Divider(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Tổng đơn hàng:", 
               style:TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16.0,
               ) ,
               ),
                Text(widget.total + " vnđ", 
               style:TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16.0,
               ) ,
               ),
             ],
           ),
           SizedBox(height:4.0),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Phí giao hàng:", 
               style:TextStyle(
                 fontSize: 14.0,
               ) ,
               ),
                Text("1000 vnđ", 
               style:TextStyle(
                 fontSize: 14.0,
               ) ,
               ),
             ],
           ),
           SizedBox(height:4.0),
           Row(
             
             children: [
               Text("Địa chỉ giao hàng:" + acc.address, 
               style:TextStyle(
                 fontSize: 14.0,
               ) ,
               ),
              ],
           ),
           Divider(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text("Tổng cộng:", 
               style:TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16.0,
               ) ,
               ),
                Text(t + " vnđ", 
               style:TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 16.0,
               ) ,
               ),
             ],
           ),
           Spacer(),
           MaterialButton( 
             onPressed: (){
                  DateTime dt = DateTime.now();
                    DateFormat fm =   DateFormat('HH:mm:ss dd-MM-yyyy');
                   String date = fm.format(dt);
                   String code = "HHM" + dt.millisecondsSinceEpoch.toString();
                  if (OrderFirebase.upOrder(widget.lstO, date, acc.id, "1","0",t,code) ==  true)
                   {
                     lstOD = [];
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)
                        {
                          return MainHome();
                        }
                      ));
                   }
             },
             color: kPrimaryColor,
             height: 50.0,
             minWidth: double.infinity,
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10.0),
             ),
             child: Text("HOÀN TẤT ĐẶT HÀNG" ,style: TextStyle( 
               color:Colors.white,
               fontSize: 14.0,
               fontWeight: FontWeight.bold,
             ),),
           ),
           SizedBox(height:18.0),
          ],
        ),
      )
    );
  }

  Widget cardItem( List<OrderModel> lstO )
  {
    return Container(
      color:Colors.white,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child:Column(
      children:List.generate(lstO.length, (index)
      {
            return Row(
              children:<Widget> [
              Container( 
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration( 
                  color:Colors.blue[300],
                  borderRadius:BorderRadius.circular(20.0),
                ),
              child: Center( 
                child: Container( 
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration( 
                  image: DecorationImage( 
                    fit: BoxFit.scaleDown,
                     image: NetworkImage(lstO[index].img)
                  ),
                  borderRadius:BorderRadius.circular(20.0),
                ),
                ),
              ),
              
              ),
              SizedBox( width:12.0
            
          ),
          Column(children: <Widget>[ 
            Container( 
              width: 100.0,
              child: Text(lstO[index].nameFood, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height:12.0),
            Container( 
              width: 100.0,
              child: Text("Số lượng: " + lstO[index].quantity, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(height:12.0),
            Container( 
              width: 100.0,
              child: Text("Giá: " + lstO[index].price, style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],)
            ],
            );
      }
      )
    )
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      margin: EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children:<Widget> [
          Container( 
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration( 
              color:Colors.blue[300],
              borderRadius:BorderRadius.circular(20.0),
            ),
          child: Center( 
            child: Container( 
              width: 60.0,
              height: 60.0,
               decoration: BoxDecoration( 
              image: DecorationImage( 
                fit: BoxFit.scaleDown,
                image:AssetImage('assets/images/hieu.jpg'),
              ),
              borderRadius:BorderRadius.circular(20.0),
            ),
            ),
          ),
           
          ),
           SizedBox( width:12.0
        
      ),
      Column(children: <Widget>[ 
        Container( 
          width: 100.0,
          child: Text("Tên sản phẩm 1", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        SizedBox(height:12.0),
        Container( 
           width: 100.0,
          child: Text("Số lượng", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        SizedBox(height:12.0),
         Container( 
           width: 100.0,
          child: Text("Giá:", style: TextStyle(fontWeight: FontWeight.bold),),
        )
      ],)
        ],
      ),
    );
  }
}