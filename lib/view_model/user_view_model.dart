import 'package:flutter/material.dart';
import 'package:flutter_architecture_sample/model/profile_ob.dart';
import 'package:flutter_architecture_sample/model/salon_item_ob.dart';
import 'package:flutter_architecture_sample/model/user_ob.dart';
import 'package:flutter_architecture_sample/network/base_response/api_response.dart';
import 'package:flutter_architecture_sample/network/base_response/object_response.dart';
import 'package:flutter_architecture_sample/repository/user_repository_impl.dart';
import 'package:flutter_architecture_sample/screens/user_profile_screen.dart';
import 'package:flutter_architecture_sample/utils/app_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserViewModel with ChangeNotifier {
  late UserRepositoryImpl _userRepositoryImpl;

  UserViewModel(
    UserRepositoryImpl userRepositoryImpl,
  ) {
    _userRepositoryImpl = userRepositoryImpl;
  }

  ApiResponse _apiResponse = ApiResponse.initial('Empty data');

  ApiResponse get response => _apiResponse;

  ProfileOb? profileOb;
  UserOb? userOb;

  List<SalonItemOb> salonList = [];

  Future<void> loginUser(
      BuildContext context, String phone, String password) async {
    AppUtils.showLoaderDialog(context);
    notifyListeners();
    final response = await _userRepositoryImpl.loginUser(phone, password);
    Navigator.pop(context);
    if (response.success != null) {
      _apiResponse =
          ApiResponse.completed(Success(status: response.success!.status));
      response.success!.status == true
          ? Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const UserProfileScreen()))
          : Fluttertoast.showToast(
              msg: "User Login is ${response.success!.status}");
    } else {
      _apiResponse = ApiResponse.error(response.failure!.errorMessage);
      Fluttertoast.showToast(msg: "${response.failure!.errorMessage}");
    }
    notifyListeners();
  }

  Future<void> getProfile(
    BuildContext context,
  ) async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    final response = await _userRepositoryImpl.getProfile();
    if (response.success != null) {
      profileOb = response.success!.successObject as ProfileOb;
      _apiResponse = ApiResponse.completed(Success(
          successList: response.success!.successObject,
          status: response.success!.status));
    } else {
      _apiResponse = ApiResponse.error(response.failure!.errorMessage);
    }
    notifyListeners();
  }

  Future<void> getSalonList() async {
    _apiResponse = ApiResponse.loading('Fetching artist data');
    final response = await _userRepositoryImpl.getSalonList();
    if (response.success != null) {
      salonList = response.success!.successList as List<SalonItemOb>;
      _apiResponse = ApiResponse.completed(Success(
          successList: response.success!.successList,
          status: response.success!.status));
    } else {
      _apiResponse = ApiResponse.error(response.failure!.errorMessage);
    }
    notifyListeners();
  }
}
