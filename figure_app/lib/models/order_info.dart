
class OrderInfo{
  String id;
  String idCustomer;
  String listfoodid;
  String listquan;
  String listprice;
  String status;
  String date;
  String totalPrice;
  String discount;
  String code;
  OrderInfo({this.id,this.idCustomer,this.listfoodid,this.listprice,this.listquan,this.date,this.status,this.totalPrice,this.discount,this.code});
}

class KeyFire{
  String key;
  String id;
  KeyFire({ this.id,this.key});
}