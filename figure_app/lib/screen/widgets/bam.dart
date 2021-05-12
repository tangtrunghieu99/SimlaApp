import 'package:figure_app/firebase/figure_fb.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:flutter/material.dart';

// Giờ ví dụ trng này là trang chủ của m , để load cái list Figure
// Đầu tiên là tạo 1 cái list
List<Figure> lstF = [];

class Bam extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return BamState();
  }
}

class BamState extends State<Bam>
{
  // cái này thì cũng copy rồi sửa lại , mặc định thì lúc ở trang chủ m phải lấy hết mấy cái trên fb về, trừ cái acccount là phải lấy từ cái sreen đăng nhập

  @override
  void initState() {
    
    super.initState();
    _setup();
  }
  void _setup() async{
    List<Figure> lstAccTemp = await FigureFirebase.getListFigure();

    if(mounted)
    {
      lstF = lstAccTemp;
 
    }
  }

  // Cái hàm setuip mà chạy được thì ok , mấy cái kia đơn giản, để desigun cái ui cơ bản , để nó hiện thông tin lên
  @override
  Widget build(BuildContext context) {
    print("da");
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // Cách truyền dữ liệu vào 1 widget này
          children:  lstF.map((e) => _cardCC(e)).toList()
        ),
      ),
    );
  }

  // Tạo 1 cái card trước đã , màu mè thoi96 chứ k gì =))
  Widget _cardCC(Figure f)
  {
    return Container(
    height: 200,
    width: 115,
    //decoration: BoxDecoration(border: OutlineInputBorder(borderSide: 1)),
    margin: EdgeInsets.only(right: 15,top: 10),
    child: Column(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child:Image.network(
          f.imgUrl,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height:5),
      Text(f.name,  style: TextStyle(
        fontSize: 13,fontWeight: FontWeight.bold,
      ),),
      SizedBox(height:5),
      Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.favorite , color: Colors.red,size: 18.0,),
              Text(f.heart.toString(),style: TextStyle(
                fontSize: 13,
              ),),
              SizedBox(width:10),
              Expanded(
                child: Text(f.price + "đ" , style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),),
              )
            ],
          ),
      ),
      
    ],
  )
  ); 
  } // ví dụ
}
