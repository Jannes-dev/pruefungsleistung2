import 'package:flutter/material.dart';

import 'HomePage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  var _isLogin = true;
  var _userEmail = "";
  var _userPassword = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page", style: TextStyle(fontSize: 26),),
      ),
      body: SingleChildScrollView(
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
                  if(value!.isEmpty || !value.contains('@')) {
                    return 'Please enter Valid email address!';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abs@email.com'
                ),
                onSaved: (value){
                  _userEmail = value!;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15.0,
                bottom: 15
              ),
              child: TextFormField(
                key: ValueKey('password'),
                validator: (String? value) {
                  return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
                },
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
                onSaved: (value){
                  _userPassword = value!;
                  print(_userPassword);
                  },
                ),
              ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextButton(
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => HomePage())
                );
                  },
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
            Text('New User? Create account'),
          ],
        ),
      ),
    );
  }

}

