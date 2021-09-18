import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:book_now_null_safety/utilities/restaurants_data_provider.dart';
import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/dummy/json_data.dart';
import 'package:book_now_null_safety/screens/restaurants/restaurants_details_page.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:book_now_null_safety/widgets/city_name_text_field.dart';
import 'package:book_now_null_safety/widgets/bes_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../constraints.dart';
import 'restaurants_results_page.dart';

class RestaurantsPage extends GetView<SearchController> {
  RestaurantsPage({Key? key}) : super(key: key);

  Future<void> findRestaurants(context) async {
    showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (context) {
          return SpinKitCircle(
            color: Colors.white,
            size: 80.0,
          );
        });
    CitiesProvied().getRestaurantsList(onSuccess: (restaurants) {
      controller.updateRestaurantsList(restaurants);
      print('success! got ${restaurants.length} restaurants');
      Get.to(() => RestaurantsResult());
    }, onError: (error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.all(12.0),
      child: ListView(
        children: <Widget>[
          Text(
            'Search and find your favorite places to eat'.tr,
            style: kPageTitleStyle,
          ),
          SizedBox(height: MySize.size16),
          CitynameTextField(
              formKey: controller.foodFormKey,
              cityName: controller.foodCityName,
              onChanged: (val) => controller.foodCityName = val),
          SizedBox(height: MySize.size20),
          Center(
            child: ElevatedButton(
              onPressed: () => findRestaurants(context),
              child: Text(
                'Search'.tr,
                style: kButtonTextStyle
              ),
            ),
          ),
          SizedBox(
            height: MySize.size20,
          ),
          Text(
            'Travelers\' Choice: Fine dining'.tr,
            style: kPageSectionTitleStyle,
          ),
          SizedBox(height: MySize.size10),
          Container(
              height: MySize.screenHeight / 3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemCount: dummyRestaurants.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return BesCard(
                        onTap: () => Get.to(DetailsPage2(
                              data:
                                  Restaurant.fromJson(dummyRestaurants[index]),
                            )),
                        restaurant:
                            Restaurant.fromJson(dummyRestaurants[index]));
                  })),
        ],
      ),
    );
  }
}
