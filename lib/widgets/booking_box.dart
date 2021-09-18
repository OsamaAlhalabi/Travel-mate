import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:book_now_null_safety/utilities/size_config.dart';
import 'package:book_now_null_safety/widgets/city_name_text_field.dart';
import 'package:book_now_null_safety/widgets/counter_widget.dart';
import 'package:book_now_null_safety/widgets/date_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../constraints.dart';
import '../utilities/hotels_data_provider.dart';
import '../screens/hotels/hotels_results_page.dart';

class BookingBox extends GetView<SearchController> {
  BookingBox({Key? key}) : super(key: key);

  bool validateAndSave() {
    final FormState? form = controller.hotelFormKey.currentState;
    if (form!.validate()) return true;
    return false;
  }

  void findCityName() {
    HotelsProvider().getLocationId(onSuccess: (data) {
      print('${controller.hotelCityName} found with id: $data');
      controller.hotelCityId = data;
    }, onError: (error) {
      print(error);
    });
  }

  Future<void> findAvailableHotels(context) async {
    if (validateAndSave() && controller.hotelCityId != '') {
      showDialog(
          context: context,
          // barrierDismissible: false,
          builder: (context) {
            return SpinKitCircle(
              color: Colors.white,
              size: MySize.size80,
            );
          });
      HotelsProvider().getHotelsList(onSuccess: (hotels) {
        controller.updatehotelsList(hotels);
        print('success! got ${hotels.length} hotels');
        Get.to(() => ResultsPage());
      }, onError: (error) {
        print(error);
      });
    }
  }

  Future<void> showTimePickerDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            elevation: 0,
            child: Container(
              height: MySize.getScaledSizeHeight(235),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[600]!),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: SfDateRangePicker(
                minDate: DateTime.now(),
                startRangeSelectionColor: Colors.deepPurple[900],
                endRangeSelectionColor: Colors.deepPurple[900],
                rangeSelectionColor: Colors.deepPurple[900]!.withOpacity(0.3),
                todayHighlightColor: Colors.deepPurple[900],
                selectionColor: Colors.deepPurple[900],
                onSelectionChanged: controller.onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                initialSelectedRange: PickerDateRange(
                    DateTime.now().add(const Duration(days: 1)),
                    DateTime.now().add(const Duration(days: 8))),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: Spacing.symmetric(horizontal: 20.0),
        height: MySize.screenHeight / 2.5,
        decoration: BoxDecoration(
            color: Get.theme.cardColor,
            border:
                Border.all(color: Color(0xff212843).withOpacity(0.8), width: 2),
            borderRadius: BorderRadius.circular(6.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Select City'.tr,style: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Urban',
                fontWeight: FontWeight.w600
              ),),
                SizedBox(height: MySize.size5),
                CitynameTextField(
                    formKey: controller.hotelFormKey,
                    cityName: controller.hotelCityName,
                    onChanged: (val) => controller.hotelCityName = val,
                    onComplete: findCityName)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Obx(
                  () => CounterWidget(
                    count: controller.adultsCount,
                    title: 'Guests Count'.tr,
                    onPlusTap: () => controller.updateAdultsCount(1),
                    onMinustap: () => controller.updateAdultsCount(-1),
                  ),
                ),
                Obx(() => CounterWidget(
                    count: controller.roomsCount,
                    title: 'Rooms Count'.tr,
                    onPlusTap: () => controller.updateRoomsCount(1),
                    onMinustap: () => controller.updateRoomsCount(-1))),
              ],
            ),
            DateWidget(
              title: 'Check-In & Check-Out'.tr,
              startDate: controller.checkInDate,
              endDate: controller.checkOutDate,
              onTap: () => showTimePickerDialog(context),
            ),
            Center(
                child: ElevatedButton(
              onPressed: () => findAvailableHotels(context),
              child: Text(
                'Search'.tr,
                style: kButtonTextStyle,
              ),
              // style: ElevatedButton.styleFrom(primary: Color(0xff212843)),
            ))
          ],
        ));
  }
}
