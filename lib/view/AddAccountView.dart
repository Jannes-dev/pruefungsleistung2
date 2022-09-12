import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pruefungsleistung/view/login.dart';

import '../structure/Account.dart';
import '../structure/Accounts.dart';

class AddAccountView extends StatefulWidget {
  const AddAccountView({super.key});

  @override
  State<AddAccountView> createState() => _AddAcountView();
}

class _AddAcountView extends State<AddAccountView> {
  final formKey = GlobalKey<FormState>();

  Accounts accounts = Accounts.createAccounts();
  String _userEmail = "";
  String _userPassword = "";
  String _userPasswordConfirmation = "";

  bool _wrongCredentials = false;

  @override
  Widget build(BuildContext context) {
    final Map<String, Account> credentials = accounts.getCredentials();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Account".tr,
          style: TextStyle(fontSize: 26),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                key: ValueKey('email'),
                autocorrect: false,
                textCapitalization: TextCapitalization.none,
                enableSuggestions: false,
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please enter valid email address!'.tr;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid emailadress'.tr),
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
                  hintText: 'Enter password'.tr,
                ),
                onSaved: (value) {
                  _userPassword = value!;
                  print(_userPassword);
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
                  labelText: 'Confirmation'.tr,
                  hintText: 'Enter password again'.tr,
                ),
                onSaved: (value) {
                  _userPasswordConfirmation = value!;
                  print(_userPassword);
                },
              ),
            ),
            if(_wrongCredentials)
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15.0, bottom: 15),
                child: Text(
                  'Username already exists or password is not the same'.tr,
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

                    if ( !credentials.containsKey(_userEmail) && _userPassword == _userPasswordConfirmation) {
                      accounts.addAccount(_userEmail, _userPassword, "user");
                      Navigator.pop(context);
                    } else {
                      _wrongCredentials = true;
                      setState(() {});
                    }
                  }
                },
                child: Text(
                  'Add Account'.tr,
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
