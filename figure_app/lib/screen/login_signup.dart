import 'package:figure_app/data/account_model.dart';
import 'package:figure_app/firebase/figure_fb.dart';
import 'package:figure_app/firebase/user_fb.dart';
import 'package:figure_app/models/category.dart';
import 'package:figure_app/screen/home_screen.dart';
import 'package:figure_app/xu/account_handle.dart';
import 'package:flutter/material.dart';
import 'package:figure_app/config/palette.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';

import '../containmain.dart';
import 'main_home.dart';
List<Account> lstAcc = [];
List<Category> lstCate = [];
class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState()=> _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isMale = true;
  bool isSignupScreen = true;
  bool isRememberMe = false;
  TextEditingController accT = TextEditingController();
  TextEditingController passW = TextEditingController();
  TextEditingController emailAPTX4869 = TextEditingController();

  // Đăng ký 
  TextEditingController accDK = TextEditingController();
  TextEditingController passDK = TextEditingController();
  TextEditingController emailDK = TextEditingController();

  @override
  void initState() {
    
    super.initState();
    _setup();
  }
  void _setup() async{
    List<Account> lstAccTemp = await UserFirebase.getListUser();
    List<Category> lstCateTeno = await FigureFirebase.getListCategory();
    if(mounted)
    {
      lstAcc = lstAccTemp;
      lstCate =lstCateTeno;
    }
  }
  @override 
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack( 
        children: [
          Positioned(

            top: 0 ,
            right: 0,
            left: 0,
             child: Container(
               height: 300,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage("images/background.jpg"),
                 )
               ),
               child: Container(
                 padding: EdgeInsets.only(top:50, left:20),
                 color: Color(0xFF3b5999).withOpacity(.60),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                   RichText(
                     text: TextSpan (
                       text: "Welcome to ",
                       style: TextStyle(
                         fontSize: 20,
                         letterSpacing: 2,
                         color: Colors.yellow[700],
                      ),
                      children: [
                        TextSpan (
                         text: isSignupScreen? "Simla," : " Back,",
                         style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold,
                         color: Colors.yellow[700],
                        ),)
                      ]
                    ) 
                  ),
                  SizedBox(height: 5,),
                  Text(
                    isSignupScreen? "Đăng ký để Tiếp tục" : " Đăng nhập để Trải nghiệm",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
           ),
          ),
          buildBottomHalfContainer(true),
          AnimatedPositioned(
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceInOut,

          top: isSignupScreen? 120 : 150,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceInOut,
            height: isSignupScreen? 380 : 270,
            padding: EdgeInsets.all(20),
            width:MediaQuery.of(context).size.width-40,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5),
                ]),
                child: SingleChildScrollView(
                                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          GestureDetector(
                            onTap: () {
                                  setState(() {
                                    isSignupScreen=false;
                                  });
                            },
                                                    child: Column(
                              children: [
                            Text(
                              "ĐĂNG NHẬP",
                              style: TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.bold,
                                color:!isSignupScreen?  Palette.activeColor:Palette.textColor1),
                              ),
                              if(!isSignupScreen)
                              Container(
                                margin: EdgeInsets.only(top:2),
                                height: 2,
                                width: 55,
                                color: Colors.orange,
                                )
                            
                              ],
                            ),
                          ),
                           GestureDetector(
                             onTap: () {
                                  setState(() {
                                    isSignupScreen=true;
                                  });
                            },
                                                      child: Column(
                               children: [
                                 Text(
                                   "ĐĂNG KÝ",
                                  style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isSignupScreen? Palette.activeColor :Palette.textColor1 ),
                                ),
                              if(isSignupScreen)  
                                Container(
                                  margin: EdgeInsets.only(top:3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.orange
                                )
                              ],
                          ),
                           )
                        ],
                      ),
                      if(isSignupScreen)
                      buildSignupSection(),
                      if(!isSignupScreen)
                      buildSigninSection()
                  ],
              ),
                ),
            ),
          ),
          buildBottomHalfContainer(false),

          Positioned(
          top:MediaQuery.of(context).size.height-100,
          right: 0,
          left: 0,
          child:Column(children: [
            //Text("Or Signup with"),
            Container(
              margin: EdgeInsets.only(right:20 , left:20 , top:15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
               
                  
                    
                      buildTextButton(MaterialCommunityIcons.facebook, "Facebook", Palette.facebookColor),
                      buildTextButton(MaterialCommunityIcons.google_plus,
                      "Google" , Palette.googleColor),
                      ],
                  ),
            )
          ],
          ),
        )
  
      ],
    ), 
  );
}

  Container buildSigninSection() {
    return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(children: [
                      buildTextField(Icons.mail_outline , 'Tên tài khoản',
                      false , true,accT ),
                      buildTextField(MaterialCommunityIcons.lock_outline,
                      "***********" , true , false,passW
                      ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(children: [
                                Checkbox(
                                  value: isRememberMe,
                                  activeColor: Palette.textColor2,
                                  onChanged: (value){
                                    setState(() {
                                      isRememberMe=!isRememberMe;
                                    });
                                  },
                                ),
                                Text("Remember Me ",
                                    style: TextStyle(
                                      fontSize: 12, color: Palette.textColor1
                                    )
                                )
                              ],),
                              TextButton(
                                onPressed: (){},
                                child: Text("Forgot Password?",
                                      style: TextStyle(
                                        fontSize: 12 , color: Palette.textColor1
                                      )
                                      ),
                              )
                            ],
                          )
                      
                    ],),
                    );
  }

  Container buildSignupSection() {
    return Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(children: [
                      buildTextField( MaterialCommunityIcons.account_outline,
                          "Username" , false , false,accDK),
                      buildTextField(MaterialCommunityIcons.email_outline,
                          "Email" , false , true ,emailDK),
                      buildTextField(MaterialCommunityIcons.lock_outline,
                          "Password", true , false,passDK) ,
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left:  10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isMale=true;
                                    });
                                  },
                                                                    child: Row(
                                      children: [
                                        Container(
                                          width: 30 ,
                                          height: 30,
                                          margin: EdgeInsets.only(right: 8),
                                          decoration:  BoxDecoration(
                                            color:isMale ? Palette.textColor2:Colors.transparent,
                                            border: Border.all(
                                                width: 1, color: isMale? Colors.transparent :Palette.textColor1),
                                              borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Icon(
                                              MaterialCommunityIcons.account_outline,
                                            color: isMale? Colors.white: Palette.iconColor,

                                           ) ,
                                          
                                          
                                          ),
                                          Text("Nam",style: TextStyle(color: Palette.iconColor),
                                          )
                              ],),
                                ),
                              SizedBox(width: 30 ,),
                              GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      isMale = false;
                                      
                                    });
                                  },
                                                                child: Row(
                                      children: [
                                        Container(
                                          width: 30 ,
                                          height: 30,
                                          margin: EdgeInsets.only(right: 8),
                                          decoration:  BoxDecoration(
                                            color: isMale? Colors.transparent : Palette.textColor2,
                                            border: Border.all(
                                                width: 1, color: isMale? Palette.textColor1 :Colors.transparent),
                                              borderRadius: BorderRadius.circular(15)
                                            ),
                                            child: Icon(MaterialCommunityIcons.account_outline,
                                            color: isMale ? Palette.iconColor: Colors.white,

                                           ) ,
                                          
                                          
                                          ),
                                          Text("Nữ",style: TextStyle(color: Palette.iconColor),
                                          )
                                ],),
                              ),
                            ],),
                          ),
                      Container(
                        width:  200,
                        margin:  EdgeInsets.only(top:20),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "By pressing 'Submit' you agree to our ",
                            style: TextStyle(color: Palette.textColor2),
                            children: [
                              TextSpan(
                               //recognizer: ,
                                text: "term & conditions",
                                style: TextStyle(color: Colors.orange),
                              )
                            ]
                          ),
                        ),
                      )
                    ],
                  ),
                );
  }

  TextButton buildTextButton( IconData icon , String title, Color backgroundColor) {
    return TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      side: BorderSide(width: 1 , color: Colors.grey),
                      minimumSize: Size(120,40),
                      shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      primary: Colors.white,
                      backgroundColor: backgroundColor
                    ),
                    child: Row(
                      children: [
                        Icon(
                           icon,
                        ),
                        SizedBox(
                          width:5,
                        ),
                        Text(
                          title,
                        )
                      ],
                    ),
                  );
  }

  Widget buildBottomHalfContainer( bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.bounceInOut,
      top: isSignupScreen? 480 : 380,
      right: 0,
      left: 0,
      child: Center(
  child: Container(
    height: 70,
    width: 70,
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        if(showShadow)
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1.5,
                  blurRadius: 10,
                  offset: Offset(0,1),
                   )
              ]
      
    ),
      child: !showShadow? Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
              colors: [Colors.orange[200], Colors.red[400]],
              begin:Alignment.topLeft,
              end:Alignment.bottomRight),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0,1),
                   )
              ]
          ),
        
          child: GestureDetector(
            onTap: ()
            {
              if(isSignupScreen)
              {
                DateTime dt = DateTime.now();
                                       DateFormat fm =  DateFormat('HHmmss');
                                       String date = fm.format(dt);
                                       String id = date;
                                       bool isSucc = UserFirebase.createUser(id, accDK.text, passDK.text, emailDK.text, "null", "null");
                                       if(isSucc)
                                       {
                                          print("thanh cong");
                                       }
                                       else
                                       {
                                          print("that bai");
                                       }
              }
              else
              {
                int l = AccountHandle.login(accT.text, passW.text, lstAcc);
                if(l == 1)
                {
                  acc = AccountHandle.getAccountfromUserName(accT.text,lstAcc);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)
                    {
                      return MainHome();
                    })
                  );
                }
                else if(l == 0)
                {
                  print("Sai tài khoản hoặc mật khẩu"); 
                }
                else
                {
                  print("Tài khoản không tồn tại");
                }
              }
            },
            child: Icon(Icons.arrow_forward, color: Colors.white)
          ),
        ): Center(),
        ),   
    ),
);
  }

  Widget buildTextField(
    IconData icon , String hintText, bool isPassword, bool isEmail,TextEditingController cc) {
    return Padding(
      padding: const EdgeInsets.only( bottom: 8.0),
      child: TextField(
        controller: cc,
                          obscureText: isPassword,
                          keyboardType: isEmail ? TextInputType.emailAddress:TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(icon,
                            color: Palette.iconColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Palette.textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Palette.textColor1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: hintText,
                            hintStyle: TextStyle(
                                fontSize: 14 , color: Palette.textColor1
                            ),
                          ),
                        ),
    );
  }
}