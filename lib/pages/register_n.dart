import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_help_list/pages//SignIn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_radio_choice/cupertino_radio_choice.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  var errorMsg;
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController genderController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  var sex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        backgroundColor: Theme.of(context).primaryColor,
        navigationBar: CupertinoNavigationBar(
          automaticallyImplyLeading: false,
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 66.0,
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(height: 15.0),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Theme.of(context).accentColor,
                  ),
                  controller: nameController,
                  // placeholder: "name",
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Email',
                  style: TextStyle(
                    // color: Color(0xffC0A66D),
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Theme.of(context).accentColor,
                  ),
                  controller: emailController,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Password',
                  style: TextStyle(
                    // color: Color(0xffC0A66D),
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.0),
                    color: Theme.of(context).accentColor,
                  ),
                  controller: passwordController,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Gender',
                  style: TextStyle(
                    // color: Color(0xffC0A66D),
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CupertinoRadioChoice(
                    selectedColor: Color(0xffC0A66D),
                    choices: {
                      'male': 'Male',
                      'female': 'Female',
                      'other': 'Other'
                    },
                    onChange: (value) {
                      sex = value;
                    },
                    initialKeyValue: 'male')),
            RaisedButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                Register(nameController.text, sex, emailController.text,
                    passwordController.text);
              },
              color: Color.fromARGB(255, 227, 204, 169),
              child: Text("Register Yourself",
                  style: TextStyle(color: Colors.black)),
            ),
            errorMsg == null
                ? Container()
                : Text(
              "${errorMsg}",
            ),
          ],
        ),
      ),
    );
  }

  Register(String name, sex, email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'name': name, 'email': email, 'password': pass, 'sex': sex};
    var jsonResponse = null;
    var response = await http.post(Uri.parse("https://109project.azurewebsites.net/member/createmember"), body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => SignInSection()),
                (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      errorMsg = response.body;
      print("The error message is: ${response.body}");
    }
  }
}
