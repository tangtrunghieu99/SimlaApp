import 'package:figure_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:figure_app/constants/constants_details.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:figure_app/config/size_config_details.dart';

import 'components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Figure figure;
// Thats means we have to  pass it
  DetailsScreen(this.figure);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(context),
      body: Body(figure: figure),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    
    return AppBar(
      
      title: Text("Chi tiết sản phẩm",style: TextStyle(color: Colors.black),),
      backgroundColor: white,
      centerTitle: true,
          elevation: 0,
      leading: IconButton(
        icon: Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/bag.svg"),
          onPressed: () {},
        ),
        SizedBox(width: SizeConfig.defaultSize),
      ],
    );
  }
}
