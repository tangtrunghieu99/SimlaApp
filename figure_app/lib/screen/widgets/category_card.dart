
import 'package:figure_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String iconPath;

  final Function() onTap;

  const CategoryCard({
    Key key,
    @required this.title,
    @required this.iconPath,
    @required this.onTap,

  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(height: 90, width: 130,
      decoration: BoxDecoration(color:Colors.white, boxShadow:[
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: Offset.zero,
          blurRadius: 15.0
        )
      ],
      ),
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Container(
            height: 42,
            width: 42,
            child: Image.network(
              iconPath,
              //color: primaryColor,
              fit: BoxFit.cover,
              ),
            ),
          Text(
            title,
            style:TextStyle(
            fontSize: 16.0,
            height: 1.5
          ),
          ),
        ],
      ),
      ),
      
    );
  }
}