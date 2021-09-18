import 'dart:ui';

import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:book_now_null_safety/dummy/json_data.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'blend_shimmer_image.dart';

class BetCard extends StatelessWidget {
  const BetCard(
      {Key? key,
      required this.name,
      required this.rate,
      required this.imgUrl,
      required this.address,
      required this.price,
      required this.height,
      this.onTap})
      : super(key: key);

  final String name;
  final String rate;
  final String imgUrl;
  final String address;
  final String price;
  final onTap;
  final double height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: Spacing.fromLTRB(10.0, 10.0, 10.0, 4.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              
              borderRadius: BorderRadius.circular(5),
              child: BlendShimmerImage(
                imageUrl: imgUrl,
                height: MySize.getScaledSizeHeight(height),
                width: double.infinity,
                boxFit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 10,
              left: 25,
              right: 25,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                  child: Container(
                    padding: Spacing.all(8),
                    height: MySize.getScaledSizeHeight(60),
                    width: MySize.screenWidth,
                    decoration: BoxDecoration(
            
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.black12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(
                              name.length > 30
                                  ? name.substring(0, 30) + '...'
                                  : name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Urban',
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  FontAwesomeIcons.mapMarker,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: MySize.size6,
                                ),
                                Text(
                                  address,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Urban',
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              price,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Urban',
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: <Widget>[
                                for (int i = 0; i < double.parse(rate); i++)
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Colors.yellow[700],
                                  ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
