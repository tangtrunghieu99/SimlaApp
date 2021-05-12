
// Ở trên fb có bao nhiêu cái thì ghi ở đây bấy nhiêu trường
// Tạo thêm mấy cái class Account , Category .. , có bao nhiêu cái trường chính nằm ngoài thì bao nhiêu cái class , viết y chang tao thế này.
// Tạo trong thư mục model , mỗi cái 1 dart riêng 
// Xong phần data
// Giờ qua firebase

class Figure
{
  String id;
  String idCategory;
  String name;
  String price;
  String imgUrl;
  int view;
  int heart;
  String star;
  String type;
  int like;
  String detail;
  //Food({this.id,this.idCategory,this.name,this.price,this.imgUrl,this.view,this.heart});
  Figure({this.id,this.idCategory,this.name,this.price,this.imgUrl,this.view,this.heart,this.like,this.star ,this.detail,this.type});

  Figure.order({this.id,this.name, this.imgUrl,this.price,this.star,this.heart});
}