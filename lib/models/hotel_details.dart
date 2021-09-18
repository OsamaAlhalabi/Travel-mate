class HotelDetails {
  String imgUrl = "https:\/\/media-cdn.tripadvisor.com\/media\/photo-s\/1c\/c0\/b1\/4b\/caption.jpg";
	PdpHeader ?pdpHeader;
	Overview ?overview;
	PropertyDescription ?propertyDescription;
	// GuestReviews ?guestReviews;
	List<Amenities> ?amenities;

	HotelDetails({this.pdpHeader, this.overview, this.propertyDescription,this.amenities});

	HotelDetails.fromJson(Map<String, dynamic> json) {
		pdpHeader = json['pdpHeader'] != null ? new PdpHeader.fromJson(json['pdpHeader']) : null;
		overview = json['overview'] != null ? new Overview.fromJson(json['overview']) : null;

		propertyDescription = json['propertyDescription'] != null ? new PropertyDescription.fromJson(json['propertyDescription']) : null;
		// guestReviews = json['guestReviews'] != null ? new GuestReviews.fromJson(json['guestReviews']) : null;
		if (json['amenities'] != null) {
			amenities = new List<Amenities>.empty(growable: true);
			json['amenities'].forEach((v) { amenities!.add(new Amenities.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.pdpHeader != null) {
      data['pdpHeader'] = this.pdpHeader!.toJson();
    }
		if (this.overview != null) {
      data['overview'] = this.overview!.toJson();
    }
		if (this.propertyDescription != null) {
      data['propertyDescription'] = this.propertyDescription!.toJson();
    }
		// if (this.guestReviews != null) {
    //   data['guestReviews'] = this.guestReviews!.toJson();
    // }
		if (this.amenities != null) {
      data['amenities'] = this.amenities!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class PdpHeader {
	String ?hotelId;
	String ?destinationId;
	String ?pointOfSaleId;
	String ?currencyCode;
	String ?occupancyKey;
	HotelLocation ?hotelLocation;

	PdpHeader({this.hotelId, this.destinationId, this.pointOfSaleId, this.currencyCode, this.occupancyKey, this.hotelLocation});

	PdpHeader.fromJson(Map<String, dynamic> json) {
		hotelId = json['hotelId'];
		destinationId = json['destinationId'];
		pointOfSaleId = json['pointOfSaleId'];
		currencyCode = json['currencyCode'];
		occupancyKey = json['occupancyKey'];
		hotelLocation = json['hotelLocation'] != null ? new HotelLocation.fromJson(json['hotelLocation']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['hotelId'] = this.hotelId;
		data['destinationId'] = this.destinationId;
		data['pointOfSaleId'] = this.pointOfSaleId;
		data['currencyCode'] = this.currencyCode;
		data['occupancyKey'] = this.occupancyKey;
		if (this.hotelLocation != null) {
      data['hotelLocation'] = this.hotelLocation!.toJson();
    }
		return data;
	}
}

class HotelLocation {
	Coordinates ?coordinates;
	String ?resolvedLocation;
	String ?locationName;

	HotelLocation({this.coordinates, this.resolvedLocation, this.locationName});

	HotelLocation.fromJson(Map<String, dynamic> json) {
		coordinates = json['coordinates'] != null ? new Coordinates.fromJson(json['coordinates']) : null;
		resolvedLocation = json['resolvedLocation'];
		locationName = json['locationName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
		data['resolvedLocation'] = this.resolvedLocation;
		data['locationName'] = this.locationName;
		return data;
	}
}

class Coordinates {
	double? latitude;
	double ?longitude;

	Coordinates({this.latitude, this.longitude});

	Coordinates.fromJson(Map<String, dynamic> json) {
		latitude = json['latitude'];
		longitude = json['longitude'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['latitude'] = this.latitude;
		data['longitude'] = this.longitude;
		return data;
	}
}

class Overview {
	List<OverviewSections> ?overviewSections;

	Overview({this.overviewSections});

	Overview.fromJson(Map<String, dynamic> json) {
		if (json['overviewSections'] != null) {
			overviewSections = new List<OverviewSections>.empty(growable: true);
			json['overviewSections'].forEach((v) { overviewSections!.add(new OverviewSections.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.overviewSections != null) {
      data['overviewSections'] = this.overviewSections!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class OverviewSections {
	String ?title;
	String ?type;
	List<String> ?content;
	String ?contentType;

	OverviewSections({this.title, this.type, this.content, this.contentType});

	OverviewSections.fromJson(Map<String, dynamic> json) {
		title = json['title'];
		type = json['type'];
		content = json['content'].cast<String>();
		contentType = json['contentType'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['title'] = this.title;
		data['type'] = this.type;
		data['content'] = this.content;
		data['contentType'] = this.contentType;
		return data;
	}
}


class PropertyDescription {
	String ?clientToken;
  
	Address ?address;
	bool ?priceMatchEnabled;
	String ?name;
	String ?starRatingTitle;
	double ?starRating;
	FeaturedPrice ?featuredPrice;
	MapWidget ?mapWidget;
	List<String> ?roomTypeNames;
	List<String> ?tagline;
	List<String> ?freebies;

	PropertyDescription({this.starRating, this.clientToken, this.address, this.priceMatchEnabled, this.name, this.starRatingTitle, this.featuredPrice, this.mapWidget, this.tagline, this.freebies});

	PropertyDescription.fromJson(Map<String, dynamic> json) {
		clientToken = json['clientToken'];
		address = json['address'] != null ? new Address.fromJson(json['address']) : null;
		priceMatchEnabled = json['priceMatchEnabled'];
		name = json['name'];
		starRatingTitle = json['starRatingTitle'];
		starRating = json['starRating'];
		featuredPrice = json['featuredPrice'] != null ? new FeaturedPrice.fromJson(json['featuredPrice']) : null;
		mapWidget = json['mapWidget'] != null ? new MapWidget.fromJson(json['mapWidget']) : null;
		roomTypeNames = json['roomTypeNames'].cast<String>();
		tagline = json['tagline'].cast<String>();
		freebies = json['freebies'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['clientToken'] = this.clientToken;
		if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
		data['priceMatchEnabled'] = this.priceMatchEnabled;
		data['name'] = this.name;
		data['starRatingTitle'] = this.starRatingTitle;
		data['starRating'] = this.starRating;
		if (this.featuredPrice != null) {
      data['featuredPrice'] = this.featuredPrice!.toJson();
    }
		if (this.mapWidget != null) {
      data['mapWidget'] = this.mapWidget!.toJson();
    }
		data['roomTypeNames'] = this.roomTypeNames;
		data['tagline'] = this.tagline;
		data['freebies'] = this.freebies;
		return data;
	}
}

class Address {
	String? countryName;
	String ?cityName;
	String ?postalCode;
	String ?provinceName;
	String ?addressLine1;
	String ?countryCode;
	String ?pattern;
	String ?fullAddress;

	Address({this.countryName, this.cityName, this.postalCode, this.provinceName, this.addressLine1, this.countryCode, this.pattern, this.fullAddress});

	Address.fromJson(Map<String, dynamic> json) {
		countryName = json['countryName'];
		cityName = json['cityName'];
		postalCode = json['postalCode'];
		provinceName = json['provinceName'];
		addressLine1 = json['addressLine1'];
		countryCode = json['countryCode'];
		pattern = json['pattern'];
		fullAddress = json['fullAddress'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['countryName'] = this.countryName;
		data['cityName'] = this.cityName;
		data['postalCode'] = this.postalCode;
		data['provinceName'] = this.provinceName;
		data['addressLine1'] = this.addressLine1;
		data['countryCode'] = this.countryCode;
		data['pattern'] = this.pattern;
		data['fullAddress'] = this.fullAddress;
		return data;
	}
}

class FeaturedPrice {
	String ?beforePriceText;
	String ?afterPriceText;
	String ?pricingAvailability;
	String? pricingTooltip;
	CurrentPrice ?currentPrice;
	bool ?taxInclusiveFormatting;
	bool ?bookNowButton;

	FeaturedPrice({this.beforePriceText, this.afterPriceText, this.pricingAvailability, this.pricingTooltip, this.currentPrice, this.taxInclusiveFormatting, this.bookNowButton});

	FeaturedPrice.fromJson(Map<String, dynamic> json) {
		beforePriceText = json['beforePriceText'];
		afterPriceText = json['afterPriceText'];
		pricingAvailability = json['pricingAvailability'];
		pricingTooltip = json['pricingTooltip'];
		currentPrice = json['currentPrice'] != null ? new CurrentPrice.fromJson(json['currentPrice']) : null;
		taxInclusiveFormatting = json['taxInclusiveFormatting'];
		bookNowButton = json['bookNowButton'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['beforePriceText'] = this.beforePriceText;
		data['afterPriceText'] = this.afterPriceText;
		data['pricingAvailability'] = this.pricingAvailability;
		data['pricingTooltip'] = this.pricingTooltip;
		if (this.currentPrice != null) {
      data['currentPrice'] = this.currentPrice!.toJson();
    }
		data['taxInclusiveFormatting'] = this.taxInclusiveFormatting;
		data['bookNowButton'] = this.bookNowButton;
		return data;
	}
}

class CurrentPrice {
	String ?formatted;
	// double ?plain;

	CurrentPrice({this.formatted});

	CurrentPrice.fromJson(Map<String, dynamic> json) {
		formatted = json['formatted'];
		// plain = json['plain'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['formatted'] = this.formatted;
		// data['plain'] = this.plain;
		return data;
	}
}

class MapWidget {
	String ?staticMapUrl;

	MapWidget({this.staticMapUrl});

	MapWidget.fromJson(Map<String, dynamic> json) {
		staticMapUrl = json['staticMapUrl'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['staticMapUrl'] = this.staticMapUrl;
		return data;
	}
}

// class GuestReviews {
// 	Brands ?brands;

// 	GuestReviews({this.brands});

// 	GuestReviews.fromJson(Map<String, dynamic> json) {
// 		brands = json['brands'] != null ? new Brands.fromJson(json['brands']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.brands != null) {
//       data['brands'] = this.brands!.toJson();
//     }
// 		return data;
// 	}
// }

// class Brands {
// 	int ?scale;
// 	String ?formattedScale;
// 	int ?rating;
// 	String ?formattedRating;
// 	bool ?lowRating;
// 	String ?badgeText;
// 	int ?total;

// 	Brands({this.scale, this.formattedScale, this.rating, this.formattedRating, this.lowRating, this.badgeText, this.total});

// 	Brands.fromJson(Map<String, dynamic> json) {
// 		scale = json['scale'];
// 		formattedScale = json['formattedScale'];
// 		rating = json['rating'];
// 		formattedRating = json['formattedRating'];
// 		lowRating = json['lowRating'];
// 		badgeText = json['badgeText'];
// 		total = json['total'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['scale'] = this.scale;
// 		data['formattedScale'] = this.formattedScale;
// 		data['rating'] = this.rating;
// 		data['formattedRating'] = this.formattedRating;
// 		data['lowRating'] = this.lowRating;
// 		data['badgeText'] = this.badgeText;
// 		data['total'] = this.total;
// 		return data;
// 	}
// }


class Amenities {
	String ?heading;
	List<ListItems> ?listItems;

	Amenities({this.heading, this.listItems});

	Amenities.fromJson(Map<String, dynamic> json) {
		heading = json['heading'];
		if (json['listItems'] != null) {
			listItems = new List<ListItems>.empty(growable: true);
			json['listItems'].forEach((v) { listItems!.add(new ListItems.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['heading'] = this.heading;
		if (this.listItems != null) {
      data['listItems'] = this.listItems!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ListItems {
	String ?heading;
	List<String> ?listItems;

	ListItems({this.heading, this.listItems});

	ListItems.fromJson(Map<String, dynamic> json) {
		heading = json['heading'];
		listItems = json['listItems'].cast<String>();
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['heading'] = this.heading;
		data['listItems'] = this.listItems;
		return data;
	}
}
