import 'package:figure_app/handle/food_handle.dart';
import 'package:figure_app/models/figure_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:figure_app/constants/constants_details.dart';
import 'package:figure_app/containmain.dart';
import 'package:figure_app/config/size_config_details.dart';
import 'package:figure_app/models/order_model.dart';
import '../../cart.dart';
import 'figure_description.dart';
import 'figure_info.dart';

class Body extends StatelessWidget {
  final Figure figure;

  const Body({Key key, this.figure}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FigureInfo(figure: figure),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: FigureDescription(
                figure: figure,
                press: () {
                 DateTime dt = DateTime.now();
                  String key =  dt.microsecondsSinceEpoch.toString();
                  OrderModel o = OrderModel(id: key,foodID: figure.id,price: figure.price,quantity: "1",nameFood: figure.name,img: figure.imgUrl);

                  lstOD = FigleHandle.processOrder(lstOD, o);
                  //print(lstOD[1].price);
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)
                    {
                      return CartPage(lstOD);
                    })
                  );
                },
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 7.5,
              child: Hero(
                tag: figure.id,
                child: Image.network(
                  figure.imgUrl,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
