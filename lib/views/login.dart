import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_trial/models/user.dart';
import 'package:home_trial/services/loginService.dart';
import 'package:home_trial/views/mainView.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final userName = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.black38,
                  ),
                )),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter user name.';
                }
                return null;
              },
              controller: userName,
              decoration: InputDecoration(
                labelText: 'User Name',
                labelStyle: TextStyle(color: Colors.black38, fontSize: 30),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
              ),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password.';
                }
                return null;
              },
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.black38, fontSize: 30),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: new UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0)),
              ),
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: AlignmentDirectional.topEnd,
                padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: IconButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _checkUser(this.userName.text, this.password.text);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.black38,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _checkUser(String username, String password) {
    if (LoginService(userName: username, password: password).checkUser()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainView(),
          settings: RouteSettings(
            arguments: User(username: username),
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          content: Text("Wrong username or password."),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }
}
