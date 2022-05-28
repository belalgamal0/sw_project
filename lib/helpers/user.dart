class User {
  bool logedIn = false;
  String userToken;
  String userEmail;
  static final User _singleton = User._internal();

  factory User() {
    return _singleton;
  }

  User._internal();
}
