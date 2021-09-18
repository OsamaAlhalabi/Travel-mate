import 'package:book_now_null_safety/Models/hotel_details.dart';
import 'package:book_now_null_safety/Models/hotel_images.dart';
import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/utilities/hotels_data_provider.dart';
import 'package:book_now_null_safety/widgets/bet_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'hotels_details_page.dart';

class ResultsPage extends GetView<SearchController> {
  ResultsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hotels = controller.hotelsList;
    return Scaffold(
      appBar: AppBar(
        elevation: 6.0,
        centerTitle: true,
        title: Text(
          'Available Hotels in ${controller.hotelCityName.capitalizeFirst}',
          style: TextStyle(fontFamily: 'Singi'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.sort,
                size: 19,
              )),
        ],
      ),
      body: Obx(() => SizedBox.expand(
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: controller.hotelsList.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return BetCard(
                    height: 220,
                    imgUrl: hotels[index].optimizedThumbUrls!.imgUrl!,
                    name: hotels[index].name!,
                    rate: hotels[index].starRating.toString(),
                    price: hotels[index].ratePlan!.price!.current!,
                    address: hotels[index].address!.locality!,
                    onTap: () {
                      controller.selectedHotelId = hotels[index].id.toString();
                      HotelsProvider().getHotelDetails(onSuccess: (data) {
                        HotelsProvider().getHotelPhotos(onSuccess: (images) {
                          Get.to(DetailsPage(
                            data: HotelDetails.fromJson(data),
                            images: HotelImages.fromJson(images),
                          ));
                        }, onError: (error) {
                          print(error);
                        });
                      }, onError: (error) {
                        print(error);
                      });
                    });
              }))),
    );
  }
}
