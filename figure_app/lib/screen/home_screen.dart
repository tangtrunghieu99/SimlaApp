import 'package:figure_app/data/fake.dart';
import 'package:figure_app/firebase/figure_fb.dart';
import 'package:figure_app/firebase/order_fb.dart';
import 'package:figure_app/models/category.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:figure_app/screen/login_signup.dart';
import 'package:figure_app/screen/widgets/category_card.dart';
import 'package:figure_app/screen/widgets/header.dart';
import 'package:figure_app/screen/widgets/image_card.dart';
import 'package:figure_app/screen/widgets/promo_card.dart';
import 'package:figure_app/screen/widgets/section.dart';
import 'package:figure_app/widgets/app_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../containmain.dart';
import '../models/order_info.dart';
import 'category/category_screen.dart';
List<Figure> lstF = [];
List<OrderInfo> lstOStatic = [];
class HomeScreen extends StatefulWidget{
  @override 
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   onCategorySelected(category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(category),
      ),
    );
  }

  @override
  void initState() {
    _setup();
    super.initState();
 
  }
  void _setup() async{
    List<Figure> lstAccTemp = await FigureFirebase.getListFigure();
      List<OrderInfo> otemp = await OrderFirebase.getOrderInfo(acc.id);
      lstF = lstAccTemp;
       lstOStatic = otemp;
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(
     //bottomNavigationBar: AppBottomNavigation(),
      body: SafeArea( 
        child: SingleChildScrollView( 
          child: Column(
              children: [
              Header(),
              Section(
                'Danh mục sản phẩm',
                lstCate.map((c){
                  return CategoryCard(
                    title: c.categoryName,
                    iconPath: c.imgage,
                    onTap: (){
                      onCategorySelected(c.id);
                    },
                  );
                }).toList(),
              ),
              Section('Khuyến mãi tháng 3', Fake.promotions.map((p) {
                return PromoCard( 
                  title: p.title,
                  subtitle: p.subtitle,
                  tag: p.tag,
                  caption: p.caption,
                  imagePath: p.imagePath,
                  backgroundImagePath: p.backgroundImagePath,
                  reverseGradient: p.reverseGradient,
                  

                );
              }).toList(),
              ),
            Section(
                  'Bán chạy nhất ',
                  Fake.trending
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),
              Section(
                  'Hàng theo bộ',
                  Fake.featured
                      .map((imagePath) => ImageCard(imagePath))
                      .toList()),

            ],
            ),
        ),
        ),
      
    );
  }  
}