import 'package:figure_app/firebase/user_fb.dart';
import 'package:flutter/material.dart';

import '../../containmain.dart';
import '../main_home.dart';

class ChangePassword extends StatefulWidget {
  @override 
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldP = TextEditingController();
  TextEditingController newP = TextEditingController();
  TextEditingController   conf = TextEditingController();

  @override 
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton( 
          icon: Icon( 
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
                Navigator.pop(context);
              }
        ),
      ),
      body: Container( 
        padding: EdgeInsets.all(20),
        child:Column(  
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ 
            SizedBox(height:20),
            Text("Đổi mật khẩu",style:TextStyle ( 
              fontSize: 25,
            ),),
            SizedBox(height:20), 
            Text("Mật khẩu cũ",style:TextStyle ( 
              fontSize: 23,
            ),),
            TextField( 
              controller: oldP,
              decoration:InputDecoration( 
                hintText:"********",
              ),
              style: TextStyle(  
                fontSize: 20,
              ),
            ),
            SizedBox(height:20),
            Text("Mật khẩu mới",style:TextStyle ( 
              fontSize: 23,
            ),),
            TextField( 
              controller: newP,
              
              decoration:InputDecoration( 
                hintText:"********",
                
              ),
              style: TextStyle(  
                fontSize: 20,
              ),
            ),
            SizedBox(height:20),
            Text("Xác nhận mật khẩu",style:TextStyle ( 
              fontSize: 23,
            ),),
            TextField( 
              controller: conf,
              decoration:InputDecoration( 
                hintText:"********",
              ),
              style: TextStyle(  
                fontSize: 20,
              ),
            ),
            SizedBox(height:40),
            Expanded( 
              child: Center( 
                child: GestureDetector(
                  onTap: ()
                  {

                      if(oldP.text == acc.password)
                      {
                          if(newP.text == conf.text)
                          {
                            acc.password = newP.text;
                            UserFirebase.updateUser(acc);
                             Navigator.push(context, MaterialPageRoute(
                              builder: (context)
                              {
                                return MainHome();
                              }
                            ));
                          }
                      }
                      else
                      {
                        print("sai");
                      }
                    
                  },
                  child: Container( 
                    padding: EdgeInsets.symmetric(horizontal:100, vertical:10),
                    decoration: BoxDecoration(  
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Colors.blue[300],
                    ),
                    child: Text("Đổi mật khẩu",style:TextStyle(  
                      fontSize:18,
                      color:Colors.white,
                    ),),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}