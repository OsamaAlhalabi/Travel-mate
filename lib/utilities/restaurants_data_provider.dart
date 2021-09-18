import 'package:book_now_null_safety/Models/restaurant.dart';
import 'package:book_now_null_safety/utilities/api_request.dart';
import 'package:book_now_null_safety/controllers/search_controller.dart';
import 'package:get/get.dart';

class CitiesProvied {
  final _searchController = Get.find<SearchController>();

  final headers = {
    'content-type': "application/x-www-form-urlencoded",
    'x-rapidapi-host': "worldwide-restaurants.p.rapidapi.com",
    'x-rapidapi-key': "f1025a44cbmshae5cfb6a84ccd5dp1ef9d9jsn0f2cd8f80dcf"
  };
  final header2 = {
    'content-type': "application/x-www-form-urlencoded",
    'x-rapidapi-host': "worldwide-restaurants.p.rapidapi.com",
    'x-rapidapi-key': "1efa92d164msh01d90804f3853d5p17d12djsn8d02050ddb80"
  };

  final header3 = {
    'content-type': "application/x-www-form-urlencoded",
    'x-rapidapi-host': "worldwide-restaurants.p.rapidapi.com",
    'x-rapidapi-key': "bc4ee83b66msh64496286c1e7ed7p155ac0jsn0fc9bf530755"
  };
  void getCityDetails({
    Function()? beforeSend,
    Function(Map<String, dynamic> city)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
            header: header2,
            url: "https://worldwide-restaurants.p.rapidapi.com/typeahead",
            data: "q=istanbul&language=en_US")
        .post(
      beforeSend: () => {if (beforeSend != null) beforeSend()},
      onSuccess: (data) {
        onSuccess!(data['results']['data'][0]['result_object']);
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }

  void getRestaurantsList({
    Function(List<Restaurant> restaurants)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    ApiRequest(
            url: "https://worldwide-restaurants.p.rapidapi.com/search",
            data: "language=en_US&limit=30&location_id=293974&currency=USD",
            header: header3)
        .post(
      onSuccess: (data) {
        print(data);
        onSuccess!((data['results']['data'] as List)
            .map((json) => Restaurant.fromJson(json))
            .toList());
      },
      onError: (error) => {if (onError != null) onError(error)},
    );
  }
}
