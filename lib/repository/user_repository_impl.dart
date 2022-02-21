import 'package:dio/dio.dart';
import 'package:flutter_architecture_sample/constant/string.dart';
import 'package:flutter_architecture_sample/model/profile_ob.dart';
import 'package:flutter_architecture_sample/model/salon_item_ob.dart';
import 'package:flutter_architecture_sample/model/user_ob.dart';
import 'package:flutter_architecture_sample/network/base_response/base_api_response.dart';
import 'package:flutter_architecture_sample/network/base_response/object_response.dart';
import 'package:flutter_architecture_sample/network/services/dio_service.dart';
import 'package:flutter_architecture_sample/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final DioService _dioService = DioService();

  @override
  Future<ReturnObject> loginUser(String phone, String password) async {
    Map<String, dynamic> map = {
      'phone': phone,
      'password': password,
    };
    final response =
        await _dioService.postRequest("user/user-login", data: map);
    if (response["dioError"] == null) {
      final parsedResponse = BaseApiResponse<UserOb>.fromObjectJson(response,
          createObject: (data) => UserOb.fromJson(data));
      return ReturnObject(
          success: Success(
              successObject: parsedResponse.objectResult,
              status: parsedResponse.status));
    } else {
      return ReturnObject(failure: Failure(errorMessage: response['dioError']));
    }
  }

  @override
  Future<ReturnObject> getProfile({String? token}) async {
    Map<String, dynamic> map = {
      'phone': "phone",
      'password': "password",
    };
    final response =
        await _dioService.getRequest("user/user-profile",);
    if (response[Constant.dioError] == null) {
      final parsedResponse = BaseApiResponse<ProfileOb>.fromObjectJson(response,
          createObject: (data) => ProfileOb.fromJson(data));
      return ReturnObject(
          success: Success(
              successList: parsedResponse.objectResult,
              status: parsedResponse.status));
    } else {
      return ReturnObject(
          failure: Failure(errorMessage: response[Constant.dioError]));
    }
  }

  @override
  Future<ReturnObject> getSalonList() async {
    final response =
        await _dioService.getRequest("user/salon-list?offset=10&name=");
    if (response[Constant.dioError] == null) {
      final parsedResponse = BaseApiResponse<SalonItemOb>.fromListJson(response,
          create: (data) => SalonItemOb.fromJson(data));
      return ReturnObject(
          success: Success(
              successList: parsedResponse.listResult,
              status: parsedResponse.status));
    } else {
      return ReturnObject(
          failure: Failure(errorMessage: response[Constant.dioError]));
    }
  }
}
