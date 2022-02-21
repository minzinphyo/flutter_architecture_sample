import 'package:flutter_architecture_sample/model/profile_ob.dart';
import 'package:flutter_architecture_sample/network/base_response/object_response.dart';

abstract class UserRepository {
  //Local
  Future<ReturnObject> loginUser(String phone, String password);

  Future<ReturnObject> getProfile();

  Future<ReturnObject> getSalonList();
}
