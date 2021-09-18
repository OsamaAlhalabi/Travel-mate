class HotelImages {
  int? hotelId;
  List<HotelImage>? hotelImages;

  HotelImages({
    this.hotelId,
    this.hotelImages,
  });

  HotelImages.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotelId'];
    if (json['hotelImages'] != null) {
      hotelImages = new List<HotelImage>.empty(growable: true);
      json['hotelImages'].forEach((v) {
        hotelImages!.add(new HotelImage.fromJson(v));
      });
    }
  }
}

class HotelImage {
  String? baseUrl;
  int? imageId;
  String? mediaGUID;
  List<Sizes>? sizes;

  HotelImage({this.baseUrl, this.imageId, this.mediaGUID, this.sizes});

  HotelImage.fromJson(Map<String, dynamic> json) {
    baseUrl = json['baseUrl'];
    imageId = json['imageId'];
    mediaGUID = json['mediaGUID'];
    if (json['sizes'] != null) {
      sizes = new List<Sizes>.empty(growable: true);
      json['sizes'].forEach((v) {
        sizes!.add(new Sizes.fromJson(v));
      });
    }
  }
}

class Sizes {
  int? type;
  String? suffix;

  Sizes({this.type, this.suffix});

  Sizes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['suffix'] = this.suffix;
    return data;
  }
}
