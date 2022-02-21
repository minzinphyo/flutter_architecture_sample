/// image : "/storage/user/901644572635.jpg"
/// name : "Phyoe Ko"
/// phone : "09782561428"
/// age : 20
/// gender : "male"
/// address : "Yangon"

class ProfileOb {
  ProfileOb({
      String? image,
      String? name,
      String? phone,
      int? age,
      String? gender,
      String? address,}){
    _image = image!;
    _name = name!;
    _phone = phone!;
    _age = age!;
    _gender = gender!;
    _address = address!;
}

  ProfileOb.fromJson(dynamic json) {
    _image = json['image'];
    _name = json['name'];
    _phone = json['phone'];
    _age = json['age'];
    _gender = json['gender'];
    _address = json['address'];
  }
  String? _image;
  String? _name;
  String? _phone;
  int? _age;
  String? _gender;
  String? _address;

  String get image => _image!;
  String get name => _name!;
  String get phone => _phone!;
  int get age => _age!;
  String get gender => _gender!;
  String get address => _address!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = _image;
    map['name'] = _name;
    map['phone'] = _phone;
    map['age'] = _age;
    map['gender'] = _gender;
    map['address'] = _address;
    return map;
  }

}