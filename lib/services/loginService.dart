class LoginService {
  String userName;
  String password;

  LoginService({this.userName, this.password});

  bool checkUser() {
    if (userName == "mete" && password == "pass")
      return true;
    else
      return false;
  }
}
