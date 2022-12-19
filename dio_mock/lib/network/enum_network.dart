enum networkEnum { BASEURL, USERLIST }

extension NetworkPathExtension on networkEnum {
  String get rawPathValue {
    switch (this) {
      case networkEnum.BASEURL:
        return "https://reqres.in";
      case networkEnum.USERLIST:
        return "/api/users?page=1";
    }
  }
}
