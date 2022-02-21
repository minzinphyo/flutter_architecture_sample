
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTcwZjUxNWFhNDFjZTBlZjA4NDc0YTIwY2I0M2E1NTI3NDQ1YzZiYTQ1ZmRiMzQwYjA2YmYxOWJkNmU1MTQ5NjY3MjRkNzY3Y2Y5NGFiM2MiLCJpYXQiOjE2NDQ5MTEzNzAsIm5iZiI6MTY0NDkxMTM3MCwiZXhwIjoxNjc2NDQ3MzcwLCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.CRwBM_hm_YZNNGQugzHriQ-0D5aQ5lIacJVRsPXrX77JRKsHZHE_JhgvoVr6cByzxhwcx29OHe80on7xdWJz8owo82_miu0E8rx1ej49wcZ1VBx8CAift2ghn6UmEMur7AetaLGEIGOPYJT-Jog_g3dttx-rHVqL_QyRLTKDFBDafpkjEU0Fs96Jhv4iZD6u65jWgxCC29vbrNnC2_aQgtXTGwx9cRiLn_v4UTaH-oLLD1X-t0hh8VmhPIyeEmyKnZ9ggDHh9Y-b_AAtsFCxKYGbmhc_czyEGjYdiUSDGV5ebVJxet32IC-g_-gQRppCRZ2-AcigHTMyqZSaWsV-fNh4A2nEX-pOg_oOFx66iAZigaFiZtLBkB4wmrAibZKp9rhytqENHK1DH-gHV9CAJJ5ag2mRFFn4Xcdb9CxdPmJFM6a9nkXN8f3hJL19bqBTVE-ZFm582n_DcQ-LOCUzWjrHpW8saCsR9HnoR0YbZGMk2eCt8y45mtTP4wME8uGmaaMw6kXMRyPVgA6TsUzC5tPxOEJprd6LMpOa74rK-KVzZCh4h3_suPxTmx7cpi1Oqb8oASKnNhvu5sfmSO723Qv-ZuiKHElMqaKDyUNoRiBoqgc77e4JJbHvgDs35qOwiiW0I3S1fRNx04WkviPCExKutW7Vi5zXFR-rIJzztyw"
/// memberId : "0000-14688-00000002"
/// qr : "5555-14788-00000002"
/// name : "mzp"
/// phone : "09977285231"
/// age : 20
/// gender : "male"
/// address : "yangon"
/// image : null

class UserOb {
  UserOb({
      String? token,
      String? memberId,
      String? qr,
      String? name,
      String? phone,
      int? age,
      String? gender,
      String? address,
      dynamic image,}){
    _token = token;
    _memberId = memberId;
    _qr = qr;
    _name = name;
    _phone = phone;
    _age = age;
    _gender = gender;
    _address = address;
    _image = image;
}

  UserOb.fromJson(dynamic json) {
    _token = json['token'];
    _memberId = json['memberId'];
    _qr = json['qr'];
    _name = json['name'];
    _phone = json['phone'];
    _age = json['age'];
    _gender = json['gender'];
    _address = json['address'];
    _image = json['image'];
  }
  String? _token;
  String? _memberId;
  String? _qr;
  String? _name;
  String? _phone;
  int? _age;
  String? _gender;
  String? _address;
  dynamic _image;

  String get token => _token!;
  String get memberId => _memberId!;
  String get qr => _qr!;
  String get name => _name!;
  String get phone => _phone!;
  int get age => _age!;
  String get gender => _gender!;
  String get address => _address!;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['memberId'] = _memberId;
    map['qr'] = _qr;
    map['name'] = _name;
    map['phone'] = _phone;
    map['age'] = _age;
    map['gender'] = _gender;
    map['address'] = _address;
    map['image'] = _image;
    return map;
  }

}