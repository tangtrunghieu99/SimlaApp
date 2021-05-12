import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:figure_app/constants.dart';
import 'package:figure_app/screen/login_signup.dart';
import 'package:figure_app/screen/main_home.dart';
import 'package:figure_app/screen/widgets/change_password.dart';
import 'package:figure_app/screen/widgets/edit_profile.dart';
import 'package:figure_app/screen/widgets/favourite_screen.dart';
import 'package:figure_app/screen/widgets/order_confirm.dart';
import 'package:figure_app/screen/widgets/orderstatus_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../containmain.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context , height: 896 , width: 414, allowFontScaling: true);

    var profileInfo = Expanded(

                                  child: Column(
                                    children: [ 
                                      Container(
                        height: kSpacingUnit.w * 10,
                        width: kSpacingUnit.w * 10,
                        margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
                                      child: Stack(
                                        children: [ 
                                          CircleAvatar(
                            radius: kSpacingUnit.w * 5,
                          
                            backgroundImage: acc.img == "null" ? AssetImage('assets/images/batman.png') : AssetImage('assets/images/hieu.jpg') ,
                          ),
                          Align(
                            alignment: Alignment.bottomRight  ,
                                            child: Container(
                                              height: kSpacingUnit.w * 2.5,
                                              width: kSpacingUnit.w * 2.5,
                                              decoration: BoxDecoration( 
                                                color: Theme.of(context).accentColor,
                                                shape:  BoxShape.circle,
                                              ),
    
                                              child: Icon(
                              LineAwesomeIcons.pen,
                              color: kDarkPrimaryColor,
                              size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                              ),
                                            ),
                          )
                                        ], 
                        ),
                      ),
                      SizedBox( height:kSpacingUnit.w * 2),
                      Text(acc.name , style: kTitleTextStyle),
                      SizedBox( height:kSpacingUnit.w * 0.5),
                      Text(acc.email , style: kCaptionTextStyle),
                      SizedBox( height:kSpacingUnit.w * 2,),
                      Container( 
                        height: kSpacingUnit.w * 4,
                        width: kSpacingUnit.w * 20,
                        decoration: BoxDecoration( 
                          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                          color: Theme.of(context).accentColor,
                        ),
                        child: Center( 
                          child: Text( ' Nâng cấp VIP 9' , style: kButtonTextStyle),
                        ),
                      )

                                    ],
                    ),
                  );
       
        var header = Row( 
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:<Widget>  [ 
                          SizedBox(width: kSpacingUnit.w * 3,),
                        
                          IconButton(
                            icon:Icon(
                            LineAwesomeIcons.arrow_left, 
                            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                            ), onPressed: () {   Navigator.pop(context);},
                          ),
                          
                          profileInfo,
                      Icon(
                        LineAwesomeIcons.sun, 
                        size: ScreenUtil().setSp(kSpacingUnit.w * 3),
                      ),
                       SizedBox(width: kSpacingUnit.w * 3,),
                      
                    ],
                  );

                return Scaffold(
                  body: Column(
                    children:<Widget> [ 
                      SizedBox(height: kSpacingUnit.w * 5,),
                      header,
                      Expanded( 
                        child: ListView( 
                          children:<Widget> [
                            GestureDetector(
                              onTap:(){Navigator.push(context, MaterialPageRoute(
                                builder:(context) 
                                {
                                  return EditProfile();
                                } )
                                );},
                            
                        child:
                             ProfileListItem( 
                               icon: LineAwesomeIcons.user_secret,
                               text: 'Chỉnh sửa thông tin',
                             ),
                            ),
                            GestureDetector(
                              onTap: (){Navigator.push(context, MaterialPageRoute(
                                builder:(context)
                                {
                                  return ChangePassword();
                                }
                              ));},
                              child:  ProfileListItem( 
                               icon: LineAwesomeIcons.user_shield,
                               text: 'Đổi mật khẩu',
                             ),
                            ),
                            GestureDetector( 
                              onTap:(){Navigator.push(context, MaterialPageRoute(
                                builder:(context) 
                                {
                                  return OrderStatusScreen();
                                }
                                ));},
                                child: ProfileListItem( 
                               icon: LineAwesomeIcons.shopping_bag,
                               text: 'Đơn hàng của bạn',
                             ),
                            ),
                             
                             ProfileListItem( 
                               icon: LineAwesomeIcons.cog,
                               text: 'Cài đặt',
                             ),
                             GestureDetector(
                               onTap: (){ Navigator.push(context, MaterialPageRoute(
                    builder: (context)
                    {
                      return LoginSignupScreen();
                    })
                  );},
                               child: ProfileListItem( 
                                 icon: LineAwesomeIcons.alternate_sign_out,
                                 text: 'Đăng xuất',
                                 hasNavigation: false,
                                 
                               ),
                             )
                          ],
                        )
                      )
        ], 

      ),
      
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  const ProfileListItem({
    Key key, 
    this.icon, 
    this.text, 
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4 ,
      ).copyWith(bottom: kSpacingUnit.w * 2 , 
      ),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4 ,),
      decoration: BoxDecoration( 
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor,
      ),
      child: Row( 
        children:<Widget> [ 
          Icon ( 
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox( width:kSpacingUnit.w * 2.5 ),
          Text( 
            this.text ,
             style: kTitleTextStyle.copyWith(
               fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          if(this.hasNavigation)
          Icon ( 
            LineAwesomeIcons.angle_right,
            size: kSpacingUnit.w * 2.5,
          )
        ],
      ),
    );
  }
}