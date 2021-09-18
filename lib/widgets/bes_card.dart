import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'blend_shimmer_image.dart';

class BesCard extends StatelessWidget {
  BesCard({Key? key, required this.onTap, required this.restaurant})
      : super(key: key);

  final ThemeData themeData = Get.theme;
  final Restaurant restaurant;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: Spacing.symmetric(vertical: 10, horizontal: 6),
        height: MySize.getScaledSizeHeight(250),
        width: MySize.getScaledSizeHeight(185),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          border: Border.all(color: themeData.colorScheme.surface, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(MySize.size16)),
          boxShadow: [
            BoxShadow(
              color: themeData.shadowColor,
              blurRadius: 8,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MySize.size16),
                  topRight: Radius.circular(MySize.size16)),
              child: BlendShimmerImage(
                imageUrl: restaurant.photo!.images!.large!.url!,
                height: MySize.getScaledSizeHeight(175),
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
            Expanded(
              // color: Colors.amber,
              // padding: Spacing.all(10.0),
              child: Padding(
                padding: Spacing.symmetric(horizontal: 10, vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        for (int i = 0;
                            i < double.parse(restaurant.rating!);
                            i++)
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.yellow[800],
                          ),
                        SizedBox(width: 3),
                        Text(
                          restaurant.numReviews! + ' Reviews',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Sansita',
                          ),
                        ),
                      ],
                    ),
                    Text(
                      restaurant.name!,
                      maxLines: 2,
                      style: TextStyle(
                          fontFamily: 'Signi', fontWeight: FontWeight.bold),
                    ),
                    Text(
                      restaurant.timezone!,
                      maxLines: 1,
                      style: TextStyle(
                        fontFamily: 'Sansita',
                        //  fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
