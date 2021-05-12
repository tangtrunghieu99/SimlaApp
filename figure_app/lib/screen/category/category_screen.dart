import 'package:figure_app/handle/food_handle.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:flutter/material.dart';
import '../../data/fake.dart';
//import '..widgets/furniture_grid_item.dart';
import '../category/widgets/furniture_grid_item.dart';
import '..//category/widgets/header_sliver.dart';
import '../../widgets/app_bottom_navigation.dart';
import '../home_screen.dart';
String vitri;
class CategoryScreen extends StatefulWidget {
  final String index;
  CategoryScreen(this.index);
  @override
  _CategoryScreenState createState() {
    vitri = index;
    return _CategoryScreenState();
    }
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<Figure> lstFu = FigleHandle.getFigureByIDCategory(vitri, lstF);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: AppBottomNavigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: HeaderSliver(
                minExtent: 120,
                maxExtent: 120,
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: lstFu.asMap().entries.map((f) { // Fake.furniture sửa cài này thành cái danh sách của , ví dụ lstFigure ...
                return FurnitureGridItem(
                    item: f.value,
                    margin: EdgeInsets.only(
                      left: f.key.isEven ? 16 : 0,
                      right: f.key.isOdd ? 16 : 0,
                    ));
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
