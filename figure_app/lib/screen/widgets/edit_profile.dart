import 'package:flutter/material.dart';

import '../../containmain.dart';
import '../../data/account_model.dart';
import '../../firebase/user_fb.dart';
import '../main_home.dart';
import 'package:figure_app/handle/food_handle.dart';
class EditProfile extends StatelessWidget {
  
    Account _acc = acc;
    TextEditingController addController =  TextEditingController();
    TextEditingController nameController =  TextEditingController();
    TextEditingController mailController =  TextEditingController();

  @override 
  Widget build(BuildContext context) {
    xuly(nameController, acc.name);
        xuly(addController, acc.address);
        xuly(mailController, acc.email);
        return Scaffold(  
          appBar: AppBar( 
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton( 
              icon: Icon( 
                Icons.arrow_back,
                color:Colors.blue,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [ 
              IconButton( 
              icon: Icon( 
                Icons.settings,
                color:Colors.blue,
              ),
              onPressed: () {},
            ),
            ],
          ),
          body: Container( 
            padding: EdgeInsets.only(left:16, top:25, right:16),
            child: GestureDetector(
              onTap:(){
                 FocusScope.of(context).unfocus();
              },
                      child: ListView( 
                children: [
                Text(
                  "Chỉnh sửa thông tin", 
                style: TextStyle(fontSize: 25, fontWeight:FontWeight.w500),
                ),
                SizedBox( 
                  height:15,
                ),
                Center(
                  child: Stack( 
                    children: [ 
                      Container( 
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration( 
                          border:Border.all( 
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor
                          ),
                          boxShadow: [ 
                            BoxShadow( 
                              spreadRadius: 2, blurRadius: 10,
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0,10),
                            )
                          ],
                          shape:BoxShape.circle,
                          image: DecorationImage( 
                            fit: BoxFit.cover,
                           image: AssetImage('assets/images/hieu.jpg') ,
                          )
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: 
                        Container( 
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration( 
                            shape: BoxShape.circle,
                            border: Border.all( 
                              width:4, 
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon( 
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox( 
                  height: 35,
                ),
                buildTextField("Họ và Tên", acc.name,nameController),
                buildTextField("Email", acc.email,mailController ),
                buildTextField("Địa chỉ", acc.address,addController),
                SizedBox( 
                  height: 10,
                ),
                Row( 
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [ 
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                      onPressed: () { },
                      child: Text("CANCEL", 
                      style:TextStyle(
                        fontSize: 14,
                        letterSpacing:2.2,
                        color: Colors.black)),
                    ),
                    RaisedButton(
                      onPressed:(){
                         _acc.name = nameController.text;
                        _acc.email = mailController.text;
                        _acc.address = addController.text;
                        if(UserFirebase.updateUser(_acc)){
                          acc = _acc;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context)
                            {
                              return MainHome();
                            }
                          ));
                        }
                      },
                      color:Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                     child: Text("SAVE",
                     style: TextStyle(
                       fontSize: 14,
                       letterSpacing: 2.2,
                       color: Colors.white),
                     ),
                     ), 
                    
                  ],
                )
                ]
              ),
            )
          )
        );
      }
    
      Widget buildTextField( String labelText, String placeholder ,TextEditingController t) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 35.0),
          child: Column(
            children:[ 
              Text(labelText,style: TextStyle(
                fontSize: 17,fontWeight: FontWeight.w500,
              ),),
              
              TextField( 
                    controller: t,
                    decoration: InputDecoration( 
                      contentPadding: EdgeInsets.only(bottom: 3),
                    //  hintText:placeholder,
                      hintText:labelText ,
                     // floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: TextStyle( 
                        fontSize:16, fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                    )
                  ),
                  ]
          ),
        );
    
      }
    
  void xuly(TextEditingController t,String name)
  {
    if(name == "null")
    {
      t.text = "Chưa có";
    }
    else
    {
      t.text = name;
    }
  }


}