import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:figure_app/models/figure_model.dart';

import 'package:figure_app/constants/constants_details.dart';

import 'package:figure_app/config/size_config_details.dart';

class FigureInfo extends StatelessWidget {
  const FigureInfo({
    Key key,
    @required this.figure,
  }) : super(key: key);

  final Figure figure;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: defaultSize*2 ),
      height: defaultSize * 37.5, //375
      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15), //150
      // color: Colors.black45,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           // Text(figure.idCategory.toUpperCase(), style: lightTextStyle),
            SizedBox(height: 12.0),
            Text(
              figure.name,
              style: TextStyle(
                fontSize: 20.0, //24
                fontWeight: FontWeight.bold,
                letterSpacing: -0.8,
                height: 1.4,
              ),
            ),
            SizedBox(height: 12.0),
            Text("Đơn Giá", style: lightTextStyle),
            Text(
              "${figure.price} \VNĐ",
              style: TextStyle(
                fontSize: defaultSize * 1.6, //16
                fontWeight: FontWeight.bold,
                height: 1.6,
              ),
            ),
            SizedBox(height: 12.0), //20
            Text("Thêm ưa thích", style: lightTextStyle),
            Row(
            children: [ 
                GestureDetector( 
                    onTap: (){},
                    child: Container( 
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration( 
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon( 
                        Icons.favorite,
                        color: Colors.red,
                        size: 35.0,
                      ),
                    ),
              ),]
            ),
          ],
        ),
      ),
    
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      // For  fixed value we can use cont for better performance
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
