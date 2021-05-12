import 'dart:math';
import 'package:figure_app/models/figure_model.dart';
import 'package:figure_app/models/order_model.dart';
import 'package:flutter/material.dart';
class FigleHandle{
  static Set<int> setOfInts = Set();


    static List<Figure> getFigureByIDCategory(String idCategory,List<Figure> f)
  {
    List<Figure> t  = f.where((e) => e.idCategory == idCategory ).toList();
    return t;
  }
  
  static String getQuantityByFoodID(String id,List<OrderModel> o)
  {
    String temp;
    for(int i =0;i<o.length;i++)
    {
      if(id == o[i].foodID)
      {
        temp = o[i].quantity;
        break;
      }
    }
    return temp;
  }
     static List<OrderModel> processOrder(List<OrderModel> lstod,OrderModel od)
  {
    int flag = 0;
    int index;
    for(int i= 0;i<lstod.length;i++ )
    {
      if(lstod[i].foodID == od.foodID)
      {
        flag = 1;
        index = i;
        break;
      }
    }

    if(flag == 0)
    {
      lstod.add(od);
    }
    else
    {
      int totalQuantity = int.parse(lstod[index].quantity) + int.parse(od.quantity);
      lstod[index].quantity = totalQuantity.toString();
    }
    return lstod;
  }
  static List<OrderModel> updateQuantity(List<OrderModel> lstO , int quantity,String foodID)
  {
    for(int i = 0;i<lstO.length;i++)
    {
      if(lstO[i].foodID == foodID){
        //int total = int.parse(lstO[i].quantity) + quantity;
        lstO[i].quantity = quantity.toString();
        break;
      }
    }
    return lstO;
  }
  // static String getQuantityFromOd(String id,List<OrderInfo> o)
  // {
  //   String temp;
  //   for(int i =0;i<o.length;i++)
  //   {
  //     if(o[i].listfoodid.contains(id))
  //     {
  //       if(o[i].listfoodid.contains(","))
  //       {
  //         List<String> tId = o[i].listfoodid.split(",");
  //          List<String> tQu = o[i].listquan.split(",");
  //          temp = tQu[(tId.indexOf(id))].toString();
  //       }
  //       else
  //       {
  //         temp = o[i].listquan;
  //       }
  //     }
  //   }
  //   return temp;
  // }

  // static String getQuantityFromODD(String id,OrderInfo o)
  // {
  //   String temp;

  //     if(o.listfoodid.contains(id))
  //     {
  //       if(o.listfoodid.contains(","))
  //       {
  //         List<String> tId = o.listfoodid.split(",");
  //          List<String> tQu = o.listquan.split(",");
  //          temp = tQu[(tId.indexOf(id))].toString();
  //       }
  //       else
  //       {
  //         temp = o.listquan;
  //       }
      
  //   }
  //   return temp;
  // }

  // static Food getFoodByID(String id,List<Food> f)
  // {
  //   List<Food> t  = f.where((e) => e.id == id ).toList();
  //   return t[0];
  // }
  // static List<Food> getListFoodfromOrder(List<OrderModel> lstO,List<Food> f)
  // {
  //   List<Food> t =[];
  //   for(int i=0;i<lstO.length;i++)
  //   {
  //     t.add(getFoodByID(lstO[i].foodID.toString(),f));
  //   }
  //   return t;
  // }
  // static List<Food> getFoodsByCategoryID(String id,List<Food> f)
  // {
  //   List<Food> t  = f.where((e) => e.idCategory == id ).toList();
  //   return t;
  // }
  // static List<Food> getListRememberLike(List<Food> f)
  // {
  //   Random rd = new Random();
  //   List<Food> temp = [];

  //   // Set không cho phép có phần tử trung
   
  //   int n = 10;
  //   for(int i=0;i<n;i++)
  //   {
  //      setOfInts.add(rd.nextInt(f.length));
     
  //   }
  //   for(int i=0;i<setOfInts.length;i++)
  //   {
  //     temp.add(f[setOfInts.elementAt(i)]); 
     
  //   }
  //   return temp;
  // }


  

  // static List<Food> getListFoodMostFavourite(List<Food> f)
  // {
  //   List<Food> fo = [];
  //   Comparator<Food> sortById = (a, b) => a.heart.compareTo(b.heart);
  //   f.sort(sortById);
  //   f = f.reversed.toList();
  //   fo = f.take(5).toList();
  //   //fo.take(5);
  //   return fo;
  // }
  // static int getRandomList(int length)
  // {
  //   List<int> temp ;
  //   for(int i = 0;i<5;i++)
  //   {
  //     temp.add(1);
  //   }
  //   Random rd = Random();
  //   return rd.nextInt(100);
  // }
  // static List<Food> getListFoodEveryone(List<Food> f)
  // {
    
  //   List<Food> fo = [];
  //    List<int> temp ;
  //   Random rd = Random();
  //  // f = f.reversed.toList();
  //   //fo = f.take(5).toList();
  //   if(f.length > 0)
  //   {
  //     for(int i = 1;i<10;i++)
  //     {
  //       fo.add(f.elementAt(rd.nextInt(f.length)));
  //     }
  //   }
  //   //fo.take(5);
  //   return fo;
  // }

  // static List<Food> getListFoodFromListID(List<OrderInfo> lsO,List<Food> f,int status)
  // {
  //   List<Food> lstFF = [];
  //   List<Food> temp = [];
  //    for(int i =0;i<lsO.length;i++)
  //     {
  //       if(int.parse(lsO[i].status) == status)
  //       {
  //         temp = getListFromStatus(lsO[i].listfoodid,f);
  //         for(int j =0;j<temp.length;j++)
  //         {
  //           lstFF.add(temp[j]);
  //         }
  //       }
      
  //   }
  //   return lstFF;
  // }
  //   static List<Food> getListFoodFromOrderInfo(OrderInfo lsO,List<Food> f,int status)
  // {
  //   List<Food> lstFF = [];
  //   List<Food> temp = [];

  //       if(int.parse(lsO.status) == status)
  //       {
  //         temp = getListFromStatus(lsO.listfoodid,f);
  //         for(int j =0;j<temp.length;j++)
  //         {
  //           lstFF.add(temp[j]);
  //         }
        
      
  //   }
  //   return lstFF;
  // }

  // static List<Food> getListFromStatus(String lstIDF,List<Food> f)
  // {
  //   List<Food> temp = [];
  //   if(lstIDF.contains(","))
  //   {
  //     List<String> lstID = lstIDF.split(",").toList();
  //     for(int i = 0;i<lstID.length;i++)
  //     {
  //       temp.add(getFoodByID(lstID[i],f));
  //     }
  //   }
  //   else
  //   {
  //     temp.add(getFoodByID(lstIDF,f));
  //   }
  //   return temp;
  // }

  // static int getIndexByFoodId(String id,List<OrderModel> o)
  // {
  //   return o.indexWhere((element) => element.foodID == id);
  // }

  // static double calRating(String idF,List<FeedBack> lstFeedStatic)
  // {
  //   double kq;
  //   if(lstFeedStatic.length > 0){
  //     List<FeedBack> lstS =lstFeedStatic.where((element) => element.idFood == idF).toList(); // List feedback có id
  //     List<String> lstT = []; 
  //     List<String> lstFitler = [];
      
    
  //     for(int i =0; i<lstS.length;i++ )
  //     {
  //       lstT.add(lstFeedStatic[i].star.toString()); // Lấy toàn bộ số sao của food đó
  //     }
  //     if(lstT.length > 0)
  //     {
  //       lstFitler = lstT.toSet().toList(); // Lọc ra các số sao bị trùng.
  //     }
  //     List<int> lstUserReview = [];
  //     for(int i = 0;i<lstFitler.length;i++)
  //     {
  //       lstUserReview.add(countIteminList(lstFitler[i],lstT)); // Đếm số người review cho mỗi bậc sao: 5 sao có 4 người , 3 sao có 20 người ...
  //     }
  //     double dStar = 0, total = 0;
  //     if(lstFitler.length == lstUserReview.length)
  //     {
      
  //       for(int i = 0;i<lstFitler.length;i++)
  //       {
  //         total += lstUserReview[i];
  //         dStar += lstUserReview[i] * double.parse(lstFitler[i]);
  //       }
  //     }
  //     else
  //     {
  //       print("Loi nang roi dai ca oi");
  //     }
  //     print(dStar.toString() +":"+ total.toString());
  //     kq = dStar / total;
  //     return kq;
  //   }
  //   return getStarByID(lstFeedStatic);
    
  // }
  // static double getStarByID(List<FeedBack> f)
  // {
  //     return double.parse(f[f.length -1 ].star);
  // }
  // static int countIteminList(String item,List<String> t)
  // {
  //   int d = 0;
  //   for(int i = 0;i<t.length;i++)
  //   {
  //     if(item == t[i])
  //       d++;
  //   }
  //   return d;
  // }

  // static List<String> getNameFoods(List<Food> f)
  // {
  //   List<String> temp = [];
  //   for(int i= 0;i<f.length;i++)
  //   {
  //     temp.add(f[i].name);
  //   }
  //   return temp;
  // }

}