import 'package:figure_app/models/figure_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:figure_app/constants/colors.dart';
import 'package:figure_app/models/item.dart';
import 'package:figure_app/screen/detail/details_screen.dart';
class FurnitureGridItem extends StatelessWidget {
  final Figure item; // Đổi item thành Figure
  final EdgeInsets margin;

  const FurnitureGridItem({
    Key key,
    @required this.item,
    this.margin,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(
          builder: (context)
          {
            return DetailsScreen(item);
          })
        );
      },
      child: Container(
        margin: margin == null ? EdgeInsets.zero : margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset.zero,
              blurRadius: 15.0,
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 37),
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(item.imgUrl),
                      // image: DecorationImage(
                      //   alignment: Alignment.bottomCenter,
                      //   image: DecorationImage(image: NetworkImage("urlImage")),
                      ),
                    ),
                  ),
                  if (item.view != 0)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '10',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      height: 1.5,
                    ),
                  ),
                  Wrap(
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '${item.price} VNĐ',
                        style: TextStyle(
                          fontSize: 13,
                          color: primaryColor,
                          height: 1.5,
                        ),
                      ),
                      if (item.view != 0)
                        Text(
                          '110000',
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.black38,
                          ),
                        )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        RatingBar.builder( 
                          initialRating: double.parse(item.star),
                          minRating: 1,
                          itemSize: 12,
                          ignoreGestures: true,
                          allowHalfRating: true,
                          itemCount: 5,
                          unratedColor: Colors.amber[100],
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            size: 2,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) => print(rating),
                        ),
                        SizedBox(width: 5),
                        Text(
                          item.star,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
