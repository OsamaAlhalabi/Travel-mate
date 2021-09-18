import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/screens/restaurants/restaurants_details_page.dart';
import 'package:book_now_null_safety/widgets/bet_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RestaurantsResult extends GetView<SearchController> {
  const RestaurantsResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final restaurants = controller.restaurantsList;
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        centerTitle: true,
        title: Text(
          'Top Restaurants in ${controller.foodCityName.length > 1 ? controller.foodCityName.capitalizeFirst : 'Turkey'}',
          style: TextStyle(fontFamily: 'Singi'),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(MdiIcons.mapMarkerCircle)),
        ],
      ),
      body: Obx(() => SizedBox.expand(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.restaurantsList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return BetCard(
                  onTap: () =>Get.to(DetailsPage2(data: restaurants[index])),
                  height: 220,
                    name: restaurants[index].name!,
                    rate: restaurants[index].rating!,
                    imgUrl: restaurants[index].photo!.images!.large!.url!,
                    address: restaurants[index].timezone!,
                    price: restaurants[index].price!);
              }))),
    );
  }
}
