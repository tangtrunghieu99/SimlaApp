import 'package:figure_app/models/category.dart';
import 'package:figure_app/models/item.dart';
import 'package:figure_app/models/promotion.dart';

class Fake {
  static int numberOfItemsInCart = 1;


  static List<Promotion> promotions = [
    Promotion(
      backgroundImagePath: 'assets/images/splash1.png',
      reverseGradient: false,
      title: 'Tất cả sản phẩm giảm giá ok chưa',
      subtitle: '50%',
      tag: '15 March 2021',
      // imagePath: 'assets/images/furniture/1.jpg',
     ),
     Promotion(
       backgroundImagePath: 'assets/images/splash2.png',
       reverseGradient: true,
       title: 'Lấy voucher rồi cho giảm được chưa',
       subtitle: '\$100.00',
       caption: 'for new member\'s\nof Simla Store',
     )
  ];
  static List<String> trending = [
    'assets/images/furniture/1.jpg',
    'assets/images/furniture/2.jpg',
  ];
  static List<String> featured = [
    'assets/images/furniture/3.jpg',
    'assets/images/furniture/4.jpg',
    'assets/images/furniture/5.jpg',
    'assets/images/furniture/6.jpg',


  ];
  
   static List<Item> furniture = [
    Item(
      name: 'Chair Dacey li - Black',
      imagePath: 'assets/images/furniture/items/dacey.png',
      originalPrice: 80,
      rating: 4.5,
      discountPercent: 30,
    ),
    Item(
      name: 'Elly Sofa Patchwork',
      imagePath: 'assets/images/furniture/items/elly.png',
      originalPrice: 140,
      rating: 4.4,
      discountPercent: 30,
    ),
    Item(
      name: 'Dobson Table - White',
      imagePath: 'assets/images/furniture/items/table 2.png',
      originalPrice: 160,
      rating: 4.3,
      discountPercent: 25,
    ),
    Item(
      name: 'Nagano Table - Brown',
      imagePath: 'assets/images/furniture/items/ezgif.com-crop.png',
      originalPrice: 140,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - White',
      imagePath: 'assets/images/furniture/items/CHair 2.png',
      originalPrice: 80,
      rating: 4.3,
      discountPercent: 20,
    ),
    Item(
      name: 'Chair Dacey li - Feather Grey',
      imagePath: 'assets/images/furniture/items/chair3.png',
      originalPrice: 80,
      rating: 4.0,
      discountPercent: 20,
    ),
  ];
  
}