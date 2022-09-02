import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login> {

  final inputController = TextEditingController();

  @override
  void dispose(){
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abs@email.com'
                ),
                controller: inputController,
                : printUserName(inputController.text),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15.0,
                bottom: 15
              ),
              child: TextField(
              obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                  ),
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
                  MaterialPageRoute(builder: (_) => HomePage()));},
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

  printUserName(String text) {
    print("Username: $text");
  }
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton was tapped!');
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
