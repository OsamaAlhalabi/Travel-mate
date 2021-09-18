import 'dart:ui';
import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:book_now_null_safety/widgets/blend_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DetailsPage2 extends StatelessWidget {
  DetailsPage2({Key? key, required this.data}) : super(key: key);
  final Restaurant data;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox.expand(
          child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BlendShimmerImage(
              imageUrl: data.photo!.images!.large!.url!,
              height: MySize.safeHeight/2.1,
              width: double.infinity,
              boxFit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MySize.screenHeight/1.75,
              width: MySize.screenWidth,
              padding: Spacing.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Get.theme.backgroundColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.name!,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.mapMarkerAlt, size: 20),
                      SizedBox(width: MySize.size8,),
                      Text(
                    data.timezone!,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w800),
                  ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for(int i=0 ;i< double.parse(data.rating!);i++)
                      Icon(Icons.star, color: Colors.yellow[700],),
                      SizedBox(width: MySize.size8,),
                      Text(
                    '${data.rating} (${data.numReviews!} reviews)',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w800),
                  ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.dollarSign, size: 20, color: Colors.lightGreen[700],),
                      SizedBox(width: MySize.size8,),
                      Text(
                    data.price!,
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w800),
                  ),
                    ],
                  ),
                  Divider(),
                  Text(
                    'Descripition',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    data.description!.isEmpty? 'There is no description' : data.description!,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: 'Urban',
                    ),
                  ),
                  Text(
                    'Cuisine',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: MySize.getScaledSizeHeight(60),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        for (int i = 0; i < data.cuisine!.length; i++)
                          Container(
                              margin: const EdgeInsets.all(8.0),
                              padding: Spacing.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all()),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                      child: Icon(Icons.fastfood),
                                      backgroundColor: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data.cuisine![i].name!,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Urban',
                                    ),
                                  )
                                ],
                              )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
