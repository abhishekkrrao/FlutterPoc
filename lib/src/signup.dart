import 'package:flutter/material.dart';
import '../Home.dart';
class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup",style: TextStyle(fontFamily: 'Montserrat-Medium', fontSize: 14),),
      ),
      body:  Column(
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
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/man.png")),
                    ),
                  ),
                ),
                TextField(
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
                      suffixStyle: const TextStyle(color: Colors.black38)),
                ),
                SizedBox(
                  height: 5.0,
                  width: double.infinity,
                ),
                TextField(
                  decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black38)),
                      hintText: 'Password *',
                      helperText: 'Please enter a valid password .',
                      labelText: 'Password *',
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
                Navigator.pop(context)
              },
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Text("Login",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontFamily: 'Montserrat-Medium',
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            GestureDetector(
              onTap: () => {

                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    MyHomePage()), (Route<dynamic> route) => false),
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => MyHomePage()))
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