import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_mock/network/enum_network.dart';

import '../model/user_model.dart';

abstract class IUserService {
  IUserService(this.dio);

  Future<List<Data>?>? getUserDataList();
  final Dio dio;
}

class UserService extends IUserService {
  UserService(super.dio);

  @override
  Future<List<Data>?>? getUserDataList() async {
    try {
      final _response = await dio.get(networkEnum.USERLIST.rawPathValue);
      if (_response.statusCode == HttpStatus.ok) {
        final data = _response.data;
        if (data is Map<String, dynamic>) {
          final _json = User.fromJson(data);
          return _json.data;
        }
        return null;
      }
      throw "Oppss Error";
    } catch (e) {
      throw Exception("Errors");
    }
  }
}
