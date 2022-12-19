import 'package:dio/dio.dart';
import 'package:dio_mock/network/enum_network.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null) {
      return _instance!;
    }
    _instance = NetworkManager._init();
    return _instance!;
  }

  late Dio dio;
  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: networkEnum.BASEURL.rawPathValue));
  }
}
