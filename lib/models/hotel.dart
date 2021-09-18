class Hotel {
  int ?id;
  String ?name;
  double ?starRating;
  Address ?address;
  GuestReviews ?guestReviews;
  List<Landmarks> ?landmarks;
  RatePlan ?ratePlan;
  OptimizedThumbUrls ?optimizedThumbUrls;

  Hotel(
      {this.id,
      this.name,
      this.starRating,
      this.address,
      this.guestReviews,
      this.landmarks,
      this.ratePlan,
      this.optimizedThumbUrls});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    starRating = json['starRating'];
    address =
        (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
    guestReviews = (json['guestReviews'] != null
        ? new GuestReviews.fromJson(json['guestReviews'])
        : null)!;
    if (json['landmarks'] != null) {
      landmarks = List<Landmarks>.empty(growable: true);
      json['landmarks'].forEach((v) {
        landmarks!.add(new Landmarks.fromJson(v));
      });
    }
    ratePlan = (json['ratePlan'] != null
        ? new RatePlan.fromJson(json['ratePlan'])
        : null)!;
    optimizedThumbUrls = (json['optimizedThumbUrls'] != null
        ? new OptimizedThumbUrls.fromJson(json['optimizedThumbUrls'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['starRating'] = this.starRating;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    if (this.guestReviews != null) {
      data['guestReviews'] = this.guestReviews!.toJson();
    }
    if (this.landmarks != null) {
      data['landmarks'] = this.landmarks!.map((v) => v.toJson()).toList();
    }
    if (this.ratePlan != null) {
      data['ratePlan'] = this.ratePlan!.toJson();
    }
    if (this.optimizedThumbUrls != null) {
      data['optimizedThumbUrls'] = this.optimizedThumbUrls!.toJson();
    }
    return data;
  }
}

class Address {
  String ?streetAddress;
  String ?extendedAddress;
  String ?locality;
  String ?postalCode;
  String ?region;
  String ?countryName;
  String ?countryCode;
  bool ?obfuscate;

  Address(
      this.streetAddress,
      this.extendedAddress,
      this.locality,
      this.postalCode,
      this.region,
      this.countryName,
      this.countryCode,
      this.obfuscate);

  Address.fromJson(Map<String, dynamic> json) {
    streetAddress = json['streetAddress'];
    extendedAddress = json['extendedAddress'];
    locality = json['locality'];
    postalCode = json['postalCode'];
    region = json['region'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    obfuscate = json['obfuscate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['streetAddress'] = this.streetAddress;
    data['extendedAddress'] = this.extendedAddress;
    data['locality'] = this.locality;
    data['postalCode'] = this.postalCode;
    data['region'] = this.region;
    data['countryName'] = this.countryName;
    data['countryCode'] = this.countryCode;
    data['obfuscate'] = this.obfuscate;
    return data;
  }
}

class GuestReviews {
  String ?rating;
  int ?total;

  GuestReviews(this.rating, this.total);

  GuestReviews.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['total'] = this.total;
    return data;
  }
}

class Landmarks {
  String ?label;
  String ?distance;

  Landmarks(this.label, this.distance);

  Landmarks.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['distance'] = this.distance;
    return data;
  }
}

class RatePlan {
  Price? price;

  RatePlan(this.price);

  RatePlan.fromJson(Map<String, dynamic> json) {
    price = (json['price'] != null ? new Price.fromJson(json['price']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    return data;
  }
}

class Price {
  String? current;
  double? exactCurrent;

  Price(this.current, this.exactCurrent);

  Price.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    exactCurrent = json['exactCurrent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['exactCurrent'] = this.exactCurrent;
    return data;
  }
}
class OptimizedThumbUrls {
  String? imgUrl;

  OptimizedThumbUrls(this.imgUrl);

  OptimizedThumbUrls.fromJson(Map<String, dynamic> json) {
    imgUrl = json['srpDesktop'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['srpDesktop'] = this.imgUrl;
    return data;
  }
}