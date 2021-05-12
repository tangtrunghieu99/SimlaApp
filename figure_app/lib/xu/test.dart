import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar( 
        title: Text("Ví dụ Row"),
      ),
      body: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[ 
          Container( 
            padding: EdgeInsets.all(20.0),
            color: Colors.cyan,
            child: Text('đầu tiên'),
          ),
          Container( 
            padding: EdgeInsets.all(20.0),
            color: Colors.pinkAccent,
            child: Text('tiếp theo'),
          ),
          Container( 
            padding: EdgeInsets.all(20.0),
            color: Colors.amber,
            child: Text('cuối cùng'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( 
        onPressed: (){},
        child: Text('Nhấn vào'),
        backgroundColor: Colors.red[600],
      ),
    );
      
  }
}
