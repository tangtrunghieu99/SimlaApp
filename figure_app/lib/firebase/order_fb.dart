import 'package:figure_app/models/order_info.dart';
import 'package:figure_app/models/order_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';

class OrderFirebase{

  // static bool upOrder(List<OrderModel> ods,String date,String idCus)
  //  {
  //    try{
  //      final fb =  FirebaseDatabase.instance.reference().child("OrderInfo");
  //      for(int i = 0;i<ods.length;i++)
  //      {
  //       fb.child(idCus).child("Order").child(i.toString()).set({
  //         "foodID": ods[i].foodID,
  //         "quantity": ods[i].quantity,
  //         "price": ods[i].price
  //       });
  //      }
  //      fb.child(idCus).set({
  //        "date": date,
  //      });
  //      return true;
  //    }
  //    catch(e)
  //    {
  //      return false;  
  //    }
  //  }
  

   static bool upOrder(List<OrderModel> ods,String date,String idCus,String idFeed,String dis,String total,String code)
   {
     String idfs = "",quantities = "",prices="";
     try{
       for(int i=0;i<ods.length;i++)
       {
         idfs +=  ods[i].foodID +",";
         quantities += ods[i].quantity + ",";
         prices +=  ods[i].price +",";
       }
       idfs = idfs.substring(0,idfs.lastIndexOf(","));
       quantities = quantities.substring(0,quantities.lastIndexOf(","));
       prices = prices.substring(0,prices.lastIndexOf(","));
       DateTime dt = DateTime.now();
       DateFormat fm =  DateFormat('HH:mm:ss dd-MM-yyyy');
       String date = fm.format(dt);
       String key = idCus + dt.microsecondsSinceEpoch.toString();
       final fb = FirebaseDatabase.instance.reference().child("OrderInfo").child(idCus).child(key);
       fb.set({
         "id": idFeed,
         "idCus": idCus,
         "listfoodid": idfs,
         "listquan": quantities,
         "listprice": prices,
         "date": date,
         "status": "0",
         "discount": dis,
         "totalPrice": total,
         "code": code
       });
       return true;
     }
     catch(e)
     {
       return false;  
     }
   }

   static Future<List<OrderInfo>> getOrderInfo(String idCus) async
   {
     List<OrderInfo> lstOO = [];
     await FirebaseDatabase.instance.reference().child("OrderInfo").child(idCus).once().then((kq) {
       if(kq.value != null){
       Map<dynamic,dynamic> m = Map.from(kq.value);
     
       m.forEach((key,e) 
       {  
         OrderInfo fo = OrderInfo(
              id: e["id"].toString(),
              idCustomer: e["idCus"].toString(),
              listfoodid: e["listfoodid"],
              listprice: e["listprice"],
              listquan: e["listquan"].toString(),
              date: e["date"],
              status: e["status"],
              discount: e["discount"],
              totalPrice: e["totalPrice"],
              code: e["code"]
          );
         
          lstOO.add(fo);
       });
       }
    });
    return lstOO;
   }

  //   static bool updateStatusOrderInfo(OrderInfo o,String statuss)
  //   {
  //     KeyFire keys = listKey.where((e) => e.id == o.id).elementAt(0);
  //     if(keys != null)
  //     {
  //       String key = keys.key; 
  //        final fb = FirebaseDatabase.instance.reference().child("OrderInfo").child(o.idCustomer).child(key);
  //        fb.set({
  //           "id": o.id,
  //           "idCus": o.idCustomer,
  //           "listfoodid": o.listfoodid,
  //           "listquan": o.listquan,
  //           "listprice": o.listprice,
  //           "date": o.date,
  //           "status": statuss,
  //           "discount": o.discount,
  //           "totalPrice": o.totalPrice,
  //           "code": o.code
  //         } );
  //         return true;
  //     }

  //     return false;
  //   }
}