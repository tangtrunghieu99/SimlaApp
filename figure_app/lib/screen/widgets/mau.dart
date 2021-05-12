
import 'package:figure_app/models/figure_model.dart';
import 'package:flutter/material.dart';

String a; // Cái này là biến toán cục , sử dụng toàn bộ chương trình , gọi ở chổ đéo nào cũng được
// Thường thì chổ này khai báo mấy cái như là List<Food> , List<OrderInfo>. Nói chung là mấy cái mà m gọi từ firebase về

class Hieu extends StatefulWidget {
  Figure f;// biến ở đây thì t goi là biến khởi tạo ,  muốn gọi nó ở dưới Widget build(BuildContext context)  thì phải thêm "widget" ở đầu 
  // Ví dụ widget.f
 // cái user tạo sẵn rồi , create là đăng kí lên fb đó
  Hieu({this.f}); // Cái này chắc chăn có ở screen food detail . Vì khi m bấm vào 1 thức ăn , nó phải truyền thông tin qua food detail
  // ctrl + cách
  @override
  State<StatefulWidget> createState() {
    return HieuState();
  }
}

class HieuState extends State<Hieu>
{
  String c; // cái này thì là biến nằm trong lúc build 
  // Giờ là ví dụ cách lấy dữ liệu từ firebase , và truyền vào
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
