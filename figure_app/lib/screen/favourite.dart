

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget{
  @override 
  State<StatefulWidget> createState(){
    return FavouriteState();
  }

}
class FavouriteState extends State<Favourite>
{
  @override 
  Widget build(BuildContext context){
    return Scaffold( 
      body:Center( 
        child:Text('Favourite')
      )
    );
  }
}