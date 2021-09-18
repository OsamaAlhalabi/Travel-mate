import 'package:book_now_null_safety/Models/hotel_details.dart';
import 'package:book_now_null_safety/Models/hotel_images.dart';
import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:book_now_null_safety/widgets/blend_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailsPage extends GetView<SearchController> {
  DetailsPage({required this.data, required this.images, Key? key})
      : super(key: key);
  final HotelDetails data;
  final HotelImages images;
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
              imageUrl:
                  images.hotelImages![0].baseUrl!.replaceAll('_{size}', ''),
              height: MySize.safeHeight / 2.1,
              width: double.infinity,
              boxFit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: MySize.screenHeight / 1.75,
              width: MySize.screenWidth,
              padding: Spacing.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Get.theme.backgroundColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    data.propertyDescription!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Urban',
                        fontWeight: FontWeight.w800),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.mapMarkerAlt, size: 20),
                      SizedBox(
                        width: MySize.size8,
                      ),
                      Text(
                        '${data.propertyDescription!.address!.cityName!}, ${data.propertyDescription!.address!.countryName!}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Urban',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 0;
                          i < data.propertyDescription!.starRating!;
                          i++)
                        Icon(
                          Icons.star,
                          color: Colors.yellow[700],
                        ),
                      SizedBox(
                        width: MySize.size8,
                      ),
                      Text(
                        '${data.propertyDescription!.starRating!} (1254 reviews)',
                        style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Urban',
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.dollarSign,
                        size: 20,
                        color: Colors.lightGreen[700],
                      ),
                      SizedBox(
                        width: MySize.size8,
                      ),
                      Text(
                        '${data.propertyDescription!.featuredPrice!.currentPrice!.formatted!} per night',
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
                    'There is no description',
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
                        for (int i = 0;
                            i <
                                data.overview!.overviewSections![0].content!
                                    .length;
                            i++)
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
                                      child: Icon(Icons.coffee),
                                      backgroundColor: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    data.overview!.overviewSections![0]
                                        .content![i],
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
