import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../structure/Account.dart';
import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  Map<String, Account> _credentials = {
    'admin@test.de': Account('admin@test.de', 'password', 'admin'),
    'user@test.de': Account('user@test.de', 'password', 'user')
  };

  bool _wrongCredentials = false;
  var _isLogin = true;
  var _userEmail = "";
  var _userPassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Login Page".tr,
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: TextFormField(
                  key: ValueKey('email'),
                  autocorrect: false,
                  textCapitalization: TextCapitalization.none,
                  enableSuggestions: false,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter Valid email address!'.tr;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abs@email.com'.tr),
                  onSaved: (value) {
                    _userEmail = value!;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                child: TextFormField(
                  key: ValueKey('password'),
                  validator: (String? value) {
                    return (value != null && value.contains('@'))
                        ? 'Do not use the @ char.'.tr
                        : null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password'.tr,
                    hintText: 'Enter secure password'.tr,
                  ),
                  onSaved: (value) {
                    _userPassword = value!;
                    print(_userPassword);
                  },
                ),
              ),
              if (_wrongCredentials)
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                  child: Text(
                    'Wrong username or password'.tr,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    final isValid = formKey.currentState?.validate();

                    if (isValid!) {
                      formKey.currentState?.save();

                      if (_credentials.containsKey(_userEmail) &&
                          _credentials[_userEmail]?.password == _userPassword) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage(_credentials[_userEmail]?.role)));
                      } else {
                        _wrongCredentials = true;
                        setState(() {});
                      }
                    }
                  },
                  child: Text(
                    'Login'.tr,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
             Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0)))),
                          onPressed: () {
                            var locale = Locale('en', 'US');
                            Get.updateLocale(locale);
                          },
                          child: Text('English'.tr)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(18.0)))),
                          onPressed: () {
                            var locale = Locale('de', 'DE');
                            Get.updateLocale(locale);
                          },
                          child: Text('German'.tr)),
                    ),
                  ]),
              SizedBox(
                height: 130,
              ),
              Text('New User? Create account'.tr),
            ],
          ),
        ),
      ),
    );
  }
}
