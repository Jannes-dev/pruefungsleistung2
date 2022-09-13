import 'Account.dart';

class Accounts{

  static Accounts _accounts = Accounts._Accounts();

  static final Map<String, Account> _credentials = {};

  Accounts._Accounts(){
    addAccount('admin@test.de', 'password', 'admin');
    addAccount('user@test.de', 'password', 'user');
  }

  static Accounts createAccounts(){

    return _accounts;
  }

  Map<String, Account> getCredentials(){
    return _credentials;
  }

  void addAccount(String userName, String password, String role){
    _credentials[userName] = Account(userName, password, role);
  }
}