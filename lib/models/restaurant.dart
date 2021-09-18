import 'package:book_now_null_safety/Models/city.dart';

class Restaurant {
  String? locationId;
  String? name;
  String? latitude;
  String? longitude;
  String? numReviews;
  String? timezone;
  String? locationString;
  Photo? photo;
  String? rating;
  String? priceLevel;
  String? price;
  String? description;
  String? phone;
  String? address;
  List<Cuisine>? cuisine;

  Restaurant({
    this.locationId,
    this.name,
    this.latitude,
    this.longitude,
    this.numReviews,
    this.timezone,
    this.locationString,
    this.photo,
    this.rating,
    this.priceLevel,
    this.price,
    this.description,
    this.phone,
    this.address,
    this.cuisine,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    numReviews = json['num_reviews'];
    timezone = json['timezone'];
    locationString = json['location_string'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    rating = json['rating'];
    priceLevel = json['price_level'];
    price = json['price'];

    description = json['description'];
    phone = json['phone'];
    address = json['address'];
    if (json['cuisine'] != null) {
      cuisine = new List<Cuisine>.empty(growable: true);
      json['cuisine'].forEach((v) {
        cuisine!.add(new Cuisine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['num_reviews'] = this.numReviews;
    data['timezone'] = this.timezone;
    data['location_string'] = this.locationString;
    data['rating'] = this.rating;
    data['price_level'] = this.priceLevel;
    data['price'] = this.price;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['address'] = this.address;
    if (this.cuisine != null) {
      data['cuisine'] = this.cuisine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cuisine {
  String? key;
  String? name;

  Cuisine({this.key, this.name});

  Cuisine.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    return data;
  }
}
