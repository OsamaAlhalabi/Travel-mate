class City {
  String? locationId;
  String? name;
  String? latitude;
  String? longitude;
  String? timezone;
  String? locationString;
  String? imgUrl;
  Photo? photo;
  String? description;

  City({
    this.locationId,
    this.name,
    this.latitude,
    this.longitude,
    this.timezone,
    this.locationString,
    this.photo,
    this.description,
    this.imgUrl,
  });

  City.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timezone = json['timezone'];
    locationString = json['location_string'];
    photo = json['photo'] != null ? new Photo.fromJson(json['photo']) : null;
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timezone'] = this.timezone;
    data['location_string'] = this.locationString;
    if (this.photo != null) {
      data['photo'] = this.photo!.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class Photo {
  Images? images;

  Photo({
    this.images,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  ImageDetails? small;
  ImageDetails? thumbnail;
  ImageDetails? original;
  ImageDetails? large;
  ImageDetails? medium;

  Images({this.small, this.thumbnail, this.original, this.large, this.medium});

  Images.fromJson(Map<String, dynamic> json) {
    small =
        json['small'] != null ? new ImageDetails.fromJson(json['small']) : null;
    thumbnail = json['thumbnail'] != null
        ? new ImageDetails.fromJson(json['thumbnail'])
        : null;
    original = json['original'] != null
        ? new ImageDetails.fromJson(json['original'])
        : null;
    large =
        json['large'] != null ? new ImageDetails.fromJson(json['large']) : null;
    medium = json['medium'] != null
        ? new ImageDetails.fromJson(json['medium'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.thumbnail != null) {
      data['thumbnail'] = this.thumbnail!.toJson();
    }
    if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.medium != null) {
      data['medium'] = this.medium!.toJson();
    }
    return data;
  }
}

class ImageDetails {
  String? width;
  String? url;
  String? height;

  ImageDetails({this.width, this.url, this.height});

  ImageDetails.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    url = json['url'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['url'] = this.url;
    data['height'] = this.height;
    return data;
  }
}
