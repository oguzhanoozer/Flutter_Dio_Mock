import 'package:dio/dio.dart';
import 'package:dio_mock/network/enum_network.dart';
import 'package:dio_mock/users/model/user_model.dart';
import 'package:dio_mock/users/service/users_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'mock_json.dart';
import 'users_mock_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late IUserService userService;

  setUp((() {
    mockDio = MockDio();
    mockDio.options = BaseOptions(baseUrl: networkEnum.BASEURL.rawPathValue);
    userService = UserService(mockDio);
  }));

  test("Users Mock Test", () async {
    when(mockDio.get(networkEnum.USERLIST.rawPathValue)).thenAnswer((_) async {
      return Response(
          data: MockData.UserMockJson,
          statusCode: 200,
          requestOptions:
              RequestOptions(path: networkEnum.USERLIST.rawPathValue));
    });
    expect(await userService.getUserDataList(), isA<List<Data>>());

    expect((await userService.getUserDataList() as List).length, 2);
  });

  test("Users Null Mock Test", () async {
    when(mockDio.get(networkEnum.USERLIST.rawPathValue)).thenAnswer((_) async {
      return Response(
          data: null,
          statusCode: 200,
          requestOptions:
              RequestOptions(path: networkEnum.USERLIST.rawPathValue));
    });
    expect(await userService.getUserDataList(), null);
  });
  test("Users Exception Mock Test", () {
    when(mockDio.get(networkEnum.USERLIST.rawPathValue)).thenAnswer((_) async {
      return Response(
          data: MockData.UserMockJson,
          statusCode: 404,
          requestOptions:
              RequestOptions(path: networkEnum.USERLIST.rawPathValue));
    });
    expect(userService.getUserDataList(), throwsException);
  });
  test("Users Exception Mock Test With Wrong Path", () {
    when(mockDio.get("")).thenAnswer((_) async {
      return Response(
          data: MockData.UserMockJson,
          statusCode: 404,
          requestOptions:
              RequestOptions(path: networkEnum.USERLIST.rawPathValue));
    });
    expect(userService.getUserDataList(), throwsException);
  });
}
