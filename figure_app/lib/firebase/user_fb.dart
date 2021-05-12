import 'package:figure_app/data/account_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class UserFirebase
{
  

 // Cái này thì cũng viết y chang t luôn , sửa 1 vài cái thôi 
 // copy 2 cái này , 1 cái get, 1 cái create
 static Future<List<Account>> getListUser() async{
   
    List<Account> lstAcc = []; 
    await  FirebaseDatabase.instance.reference().child("Account").once().then((kq) async => { 
      kq.value.forEach((key,child)
      {
        Account ac = Account(
          id: child["id"].toString(),
          username: child["username"],
          password: child["password"],
          gender: child["gender"],
          name: child["name"],
          email: child["email"],
          phone: child["phone"],
          address: child["address"],
          type: child["type"],
          img: child["img"]
        );
        lstAcc.add(ac);
      })
    });
    //print("Trong giấc mơ: " +lstAcc[0].name);
    return lstAcc;
  }
  static bool createUser(String id,String username,String password, String email,String img,String displayname) {
     try{
        final fb =  FirebaseDatabase.instance.reference().child("Account").child(username);
        fb.set({
          "id": id,
          "username": username,
          "password": password,
          "email": email,
          "gender": "null",
          "phone": "null",
          "address": "null",
          "name": displayname,
          "type": "0",
          "img": img,
        });
      return true;
     }
     catch(e)
     {
       return false;
     }
   }
   static bool updateUser(Account acc)
   {
     try{
        final fb =  FirebaseDatabase.instance.reference().child("Account").child(acc.username);
        fb.set({
          "id": acc.id,
          "username": acc.username,
          "password": acc.password,
          "email": acc.email,
          "gender": "null",
          "phone": acc.phone,
          "address": acc.address,
          "name": acc.name,
          "type": acc.type,
          "img": acc.img
        });
      return true;
     }
     catch(e)
     {
       return false;
     }
   }
  
}