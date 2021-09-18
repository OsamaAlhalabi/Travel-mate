import 'package:book_now_null_safety/Models/city.dart';
import 'package:book_now_null_safety/dummy/json_data.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:book_now_null_safety/widgets/city_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constraints.dart';
import '../../widgets/booking_box.dart';

class HotelBookingPage extends StatelessWidget {
  const HotelBookingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Text(
            'Find and book a great hotel'.tr,
            style: kPageTitleStyle
          ),
          SizedBox(height: MySize.size10),
          Text(
            'Discover more of your destination and make the most of your trip'
                .tr,
            style: kPageSubTitleStyle,
          ),
          SizedBox(height: MySize.size10),
          BookingBox(),
          SizedBox(height: MySize.size22),
          Text(
            'Top Destinations'.tr,
            style: kPageSectionTitleStyle,
          ),
          SizedBox(height: MySize.size6),
          Column(
            children: <Widget>[
              CityWidget(
                city: City.fromJson(topDestinations[0]),
                onTap: () {},
              ),
              CityWidget(
                city: City.fromJson(topDestinations[1]),
                onTap: () {},
              ),
              CityWidget(
                city: City.fromJson(topDestinations[2]),
                onTap: () {},
              ),
              CityWidget(
                city: City.fromJson(topDestinations[3]),
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    ));
  }
}
