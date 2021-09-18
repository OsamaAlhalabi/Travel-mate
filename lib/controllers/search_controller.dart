import 'package:book_now_null_safety/Models/hotel.dart';
import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

List<String> sortOrders = [
  'PRICE',
  'BEST_SELLER',
  'STAR_RATING_HIGHEST_FIRST',
  'STAR_RATING_LOWEST_FIRST',
  'DISTANCE_FROM_LANDMARK',
  'GUEST_RATING',
  'PRICE_HIGHEST_FIRST',
];

class SearchController extends GetxController {
  RxString _sortOrder = 'PRICE'.obs;
  RxString _hotelCityName = ''.obs;
  RxString _hotelCityId = ''.obs;
  RxInt _adultsCount = 3.obs;
  RxInt _roomsCount = 2.obs;
  DateTime _checkInDate = DateTime.now();
  DateTime _checkOutDate = DateTime.now().add(Duration(days: 4));

  final GlobalKey<FormState> hotelFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> foodFormKey = GlobalKey<FormState>();

  String get hotelCityName => _hotelCityName.value;

  set hotelCityName(String value) {
    _hotelCityName.value = value;
  }

  String get hotelCityId => _hotelCityId.value;

  set hotelCityId(String value) {
    _hotelCityId.value = value;
  }

  String get sortOrder => _sortOrder.value;
  set sortOrder(String value) {
    _sortOrder.value = value;
  }

  int get adultsCount => _adultsCount.value;
  set adultsCount(int value) {
    _adultsCount.value = value;
  }

  int get roomsCount => _roomsCount.value;
  set roomCount(int value) {
    _roomsCount.value = value;
  }

  String get checkInDate =>
      DateFormat('yyyy-MM-dd').format(_checkInDate).toString();

  String get checkOutDate =>
      DateFormat('yyyy-MM-dd').format(_checkOutDate).toString();

  void updateAdultsCount(int value) {
    if (_adultsCount.value == 1 && value == 1)
      _adultsCount.value = _adultsCount.value + value;
    else if (_adultsCount < 10 && _adultsCount > 1)
      _adultsCount.value = _adultsCount.value + value;
  }

  void updateRoomsCount(int value) {
    if (_roomsCount.value == 1 && value == 1)
      _roomsCount.value = _roomsCount.value + value;
    if (_roomsCount < 12 && _roomsCount > 1)
      _roomsCount.value = _roomsCount.value + value;
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _checkInDate = args.value.startDate;
      _checkOutDate = args.value.endDate;
      print(checkInDate);
    }
  }

  RxList<Hotel> hotelsList = List<Hotel>.empty(growable: true).obs;

  void updatehotelsList(data) {
    hotelsList.clear();
    hotelsList.addAll(data);
  }

  //Restaurants..

  RxString _foodCityName = 'Istanbul'.obs;
  RxString _foodCityId = ''.obs;
  String get foodCityName => _foodCityName.value;

  set foodCityName(String value) {
    _foodCityName.value = value;
  }

  String get foodCityId => _foodCityId.value;

  set foodCityId(String value) {
    _foodCityId.value = value;
  }

  RxList<Restaurant> restaurantsList =
      List<Restaurant>.empty(growable: true).obs;

  void updateRestaurantsList(data) {
    restaurantsList.clear();
    restaurantsList.addAll(data);
  }

  RxString _selectedHotelId = ''.obs;
  String get selectedHotelId => _selectedHotelId.value;

  set selectedHotelId(String value) {
    _selectedHotelId.value = value;
  }
  
}
