
import 'package:book_now_null_safety/Models/city.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:flutter/material.dart';

import 'blend_shimmer_image.dart';

class CityWidget extends StatelessWidget {
  const CityWidget({
    Key? key,
    required this.city,
    required this.onTap,
  }) : super(key: key);

  final City city;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            height: MySize.screenHeight / 3.75,
            width: MySize.screenWidth,
            margin: Spacing.vertical(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: BlendShimmerImage(
                imageUrl: city.photo!.images!.large!.url!,
                height: MySize.getScaledSizeHeight(200),
                width: double.infinity,
                boxFit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            margin:Spacing.vertical(5),
            padding: Spacing.all(16),
            height: MySize.screenHeight / 3.75,
            width: MySize.screenWidth,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: <Color>[
              Colors.transparent,
              Colors.black
            ],
              ),
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black26),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  city.locationString!,
                  style: TextStyle(
                      color: Colors.white, fontSize: 25.0, fontFamily: 'Signi'),
                ),
                Text(
                  city.description!.split('.')[0],
                  style: TextStyle(color: Colors.white70, fontSize: 15.0,fontFamily: 'Signi'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
