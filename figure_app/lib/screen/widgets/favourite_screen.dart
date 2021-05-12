import 'package:flutter/material.dart';

class FavouriteScreen extends StatefulWidget {
  @override 
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override 
  Widget build( BuildContext context) {
    return Scaffold( 
      appBar:  AppBar( 
        elevation: 0.0,
        backgroundColor: Colors.transparent ,
        leading: IconButton( 
          icon: Icon(Icons.keyboard_arrow_left,color:Colors.black,), onPressed: () {  },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:16.0),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [ 
            Text( 
              "Danh mục ưa thích",
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 21.0
              ),
            ),
            SizedBox(height:12.0),
            
            Row(
              children: <Widget>[
                Container( 
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration( 
                    color:Colors.green[300],
                    borderRadius:BorderRadius.circular(20.0),
                  ),
                  child: Center( 
                    child: Container( 
                      width: 60.0,
                      height: 60.0,
                      padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration( 
                    
                    image: DecorationImage( 
                      
                      fit: BoxFit.scaleDown,
                      image:AssetImage('assets/images/hieu.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                    ),
                  ),
                ),
                SizedBox(height:12.0),
                Column(  
                  
                  children:<Widget> [ 
                    Container(
                      width: 200.0,
                      child: Text("Tên sản phẩm 1:",style: TextStyle( 
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    ),
                    SizedBox(height:12.0),
                    Container( 
                      width: 200.0,
                      child: Text("Giá:",style: TextStyle( 
                        fontWeight: FontWeight.bold,
                      ),
                      )
                    )
                  ],
                )
              ],
            ),
          ],),
      ),
    );
  }
}