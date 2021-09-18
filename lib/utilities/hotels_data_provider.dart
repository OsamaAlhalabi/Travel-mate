import 'package:book_now_null_safety/Models/hotel.dart';
import 'package:book_now_null_safety/utilities/api_request.dart';
import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:get/get.dart';

class HotelsProvider {
  final _searchController = Get.find<SearchController>();

  final headers1 = {
    'x-rapidapi-host': "hotels4.p.rapidapi.com",
    'x-rapidapi-key': "f1025a44cbmshae5cfb6a84ccd5dp1ef9d9jsn0f2cd8f80dcf"
  };
  final headers2 = {
    'x-rapidapi-host': "hotels4.p.rapidapi.com",
    'x-rapidapi-key': "bc4ee83b66msh64496286c1e7ed7p155ac0jsn0fc9bf530755"
  };

  void getLocationId({
    Function(String id)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
        header: headers1,
        url: "https://hotels4.p.rapidapi.com/locations/search",
        data: {
          "query": _searchController.hotelCityName.toLowerCase(),
          "locale": "en_US"
        }).get(
      onSuccess: (data) {
        onSuccess!(data['suggestions'][0]['entities'][0]['destinationId']);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getHotelsList({
    Function(List<Hotel> hotels)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
            url: "https://hotels4.p.rapidapi.com/properties/list",
            data: {
              "destinationId": _searchController.hotelCityId,
              "pageNumber": "1",
              "pageSize": "25",
              "checkIn": _searchController.checkInDate,
              "checkOut": _searchController.checkOutDate,
              "adults1": _searchController.adultsCount,
              "sortOrder": _searchController.sortOrder,
              "locale": "en_US",
              "currency": "USD"
            },
            header: headers1)
        .get(
      onSuccess: (data) {
        onSuccess!((data['data']['body']['searchResults']['results'] as List)
            .map((hotelJson) => Hotel.fromJson(hotelJson))
            .toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getHotelDetails({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
        header: headers1,
        url: "https://hotels4.p.rapidapi.com/properties/get-details",
        data: {
          "id": _searchController.selectedHotelId,
          "checkIn": "2020-01-08",
          "checkOut": "2020-01-15",
          "adults1": "1",
          "currency": "USD",
          "locale": "en_US"
        }).get(
      onSuccess: (data) {
        onSuccess!(data['data']['body']);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getHotelPhotos({
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
        header: headers1,
        url: "https://hotels4.p.rapidapi.com/properties/get-hotel-photos",
        data: {"id": _searchController.selectedHotelId}).get(
      onSuccess: (data) {
        onSuccess!(data);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
