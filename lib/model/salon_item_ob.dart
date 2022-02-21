/// id : 3
/// positionId : 1
/// position : "Stylist"
/// name : "decian"
/// staffDetail : "老婆"
/// image : "/storage/staff/551639202330.jpg"

class SalonItemOb {
  SalonItemOb({
    this.id,
    this.name,
    this.phone,
    this.address,
    this.latitude,
    this.longitude,
    this.image,
  });

  SalonItemOb.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    image = json['image'];
  }

  int? id;
  String? name;
  String? phone;
  String? latitude;
  String? longitude;
  String? address;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['address'] = address;
    map['image'] = image;
    return map;
  }
}
