import 'package:flutter/cupertino.dart';

class BaseApiResponse<T> {
  T? _objectResult;
  List<T>? _listResult;
  bool? _statusCode;
  String? _message;

  dynamic get objectResult => _objectResult;

  dynamic get listResult => _listResult;

  bool? get status => _statusCode;

  String? get message => _message;

  BaseApiResponse(
      {dynamic objectResult,
      dynamic listResult,
      bool? status,
      String? message}) {
    _objectResult = objectResult;
    _listResult = listResult;
    _statusCode = status;
    _message = message;
  }

  factory BaseApiResponse.fromObjectJson(Map<String, dynamic> json,
      {@required Function(Map<String, dynamic>)? createObject}) {
    return BaseApiResponse<T>(
      objectResult: json["data"] != null ? createObject!(json["data"]) : null,
      status: json["status"],
      message: json["message"],
    );
  }

  factory BaseApiResponse.fromStringJson(
    Map<String, dynamic> json,
  ) {
    return BaseApiResponse<T>(
      objectResult: json["result"],
      status: json["statusCode"],
      message: json["message"],
    );
  }

  factory BaseApiResponse.fromListJson(Map<String, dynamic> json,
      {Function(Map<String, dynamic>)? create}) {
    var data = <T>[];
    json['data'].forEach((v) {
      data.add(create!(v));
    });

    return BaseApiResponse<T>(
        status: json["status"],
        message: json["message"],
        listResult: data);
  }
}
