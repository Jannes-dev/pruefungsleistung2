
class Account {

  String _userName = "";


  String _password = "";

  String _role = "";

  Account(String userName, String password, String role){
    _userName = userName;
    _password = password;
    _role = role;
  }



  String get userName => _userName;

  String get password => _password;

  String get role => _role;
}