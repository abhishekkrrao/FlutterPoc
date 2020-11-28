import 'package:dharmlok/src/signup.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../Home.dart';

class LoginPage extends StatelessWidget {
  final LocalStorage storage = new LocalStorage('user');
  var email = "";
  var password = "";

  _saveToStorage(BuildContext context) {
    storage.setItem('email', this.email);
    storage.setItem('password', this.password);
    storage.setItem('islogin', true).then((value) => {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => MyHomePage()),
              (Route<dynamic> route) => false),
    });
  }

  setEmail(value) {
    email = value;
  }

  setPassword(value) {
    password = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 14),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: new BoxDecoration(
                      border:Border.all(),
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/man.png")),
                    ),
                  ),
                ),
                TextField(
                  onChanged: (value) => {setEmail(value)},
                  style: TextStyle(fontFamily: 'Montserrat-Medium'),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black38)),
                      hintText: 'Email *',
                      helperText: 'Please enter a valid email id.',
                      labelText: 'Email *',
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.black38,
                      ),
                      prefixText: ' ',
                      suffixText: '',
                      suffixStyle: const TextStyle(
                          color: Colors.black38,
                          fontFamily: 'Montserrat-Medium')),
                ),
                SizedBox(
                  height: 5.0,
                  width: double.infinity,
                ),
                TextField(
                  onChanged: (value) => {setPassword(value)},
                  style: TextStyle(fontFamily: 'Montserrat-Medium'),
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black38)),
                      hintText: 'Password *',
                      helperText: 'Please enter a valid password .',
                      helperStyle: TextStyle(fontFamily: 'Montserrat-Medium'),
                      labelText: 'Password *',
                      labelStyle: TextStyle(fontFamily: 'Montserrat-Medium'),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.black38,
                      ),
                      prefixText: ' ',
                      suffixText: '',
                      suffixStyle: const TextStyle(color: Colors.black38)),
                )
              ],
            ),
          ),
          new Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SignupPage()))
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text("Signup",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Montserrat-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            GestureDetector(
              onTap: () => {
                _saveToStorage(context),

              },
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.indigo,
                      fontFamily: 'Montserrat-Medium',
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
