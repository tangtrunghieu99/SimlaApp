import 'package:figure_app/data/fake.dart';
import 'package:figure_app/screen/widgets/search_bar.dart';
import 'package:figure_app/widgets/cart.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: 
                [
                  Text('SimLa Store' ,
                  style: TextStyle(fontSize: 28.0 , height :1),
          
                      ),
                  Cart(numberOfItemsInCart: Fake.numberOfItemsInCart),
                ],
        
          ),
        Text('Mang cả thế giới anime vào nhà bạn',
        style: TextStyle(fontSize: 15.0 , height: 2,color: Colors.black38),
        ),
        SearchBar(),
      ],),
    );
  }
}