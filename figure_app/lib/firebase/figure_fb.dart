import 'package:figure_app/models/category.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// Giờ ví dụ muốn lấy danh sách các model từ firebase
class FigureFirebase
{
  // Đổi 1 vài cái là được
  static Future<List<Figure>> getListFigure() async{
   
    List<Figure> lstF = []; 
    await  FirebaseDatabase.instance.reference().child("Figure").once().then((kq) { 
    List<dynamic> lstD = kq.value;
      for(int i=  0;i<lstD.length;i++)
      {
         Map<dynamic, dynamic> child = Map.from(lstD[i]);
      
            Figure fo = Figure(
              id: child["id"].toString(),
              idCategory: child["idCategory"].toString(),
              name: child["name"],
              imgUrl: child["imgUrl"],
              price: child["price"].toString(),
              view: child["view"],
              heart: child["heart"],
              star: child["star"].toString(),
              like: child["like"],
              detail: child["detail"],
          );
         lstF.add(fo);
      }
    });

    return lstF;
  }
    static Future<List<Category>> getListCategory() async{
    List<Category> lstF = [];
    await FirebaseDatabase.instance.reference().child("Category").once().then((kq) {
      List<dynamic> lstD=kq.value;
      for(int i=  0;i<lstD.length;i++)
      {
         Map<dynamic, dynamic> child = Map.from(lstD[i]);
      
            Category fo = Category(
              id: child["id"].toString(),
              categoryName: child["name"],
              imgage: child["imgUrl"],
          );
         lstF.add(fo);
      }
      
    });
    return lstF;
    
  }
  
}