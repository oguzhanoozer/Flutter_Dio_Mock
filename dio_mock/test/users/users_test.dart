import 'package:dio/dio.dart';
import 'package:dio_mock/network/enum_network.dart';
import 'package:dio_mock/users/model/user_model.dart';
import 'package:dio_mock/users/service/users_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Users Test", () {
    late Dio dio;

    late IUserService _userService;

    setUp((() {
      dio = Dio(BaseOptions(baseUrl: networkEnum.BASEURL.rawPathValue));
      _userService = UserService(dio);
    }));

    test("Dio Service Testing", () async {
      final _data = await _userService.getUserDataList();
      expect(_data, isA<List<Data>>());
    });
  });
}
