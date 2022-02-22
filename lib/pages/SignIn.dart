import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'register_n.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';
import 'package:the_help_list/pages/shared_preferences_util.dart';

class SignInSection extends StatefulWidget {
  static const String id = "SignInSection";
  @override
  _SignInSectionState createState() => new _SignInSectionState();
}

//StatelessWidget表一個沒有狀態的widget，state在widget生命週期是不可變的
class _SignInSectionState extends State<SignInSection> {
  // 儲存的值
  String _savedValue = "載入中..";

  // 當前輸入的值
  String _currentUser;
  @override
  void initState() {
    super.initState();
    SharedPreferencesUtil.getData<String>("token").then((value) {
      setState(() {
        _savedValue = value;
      });
    });
  }

  bool _isLoading = false;
  var errorMsg;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  //用Widget的bulild方法來建構頁面
  Widget build(BuildContext context) {
    //Scaffold是Material庫提供的頁面腳手架
    final logo = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 66.0,
      child: Image.asset('assets/images/logo.png'),
    );
    final email = TextFormField(
      keyboardType: TextInputType.name,
      maxLines: 1,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: "Enter your Email",
          hintStyle: TextStyle(color: Theme.of(context).accentColor)),
      style: TextStyle(
        color: Colors.white,
      ),
      controller: emailController,
    );
    final password = TextFormField(
      keyboardType: TextInputType.name,
      maxLines: 1,
      autofocus: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          hintText: "Enter your password",
          hintStyle: TextStyle(color: Theme.of(context).accentColor)),
      style: TextStyle(
        color: Colors.white,
      ),
      controller: passwordController,
    );
    SizedBox(height: 18.0);
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signin(emailController.text, passwordController.text);
        },
        padding: EdgeInsets.all(12),
        color: Theme.of(context).accentColor,
        child: Text("Login",
            style: GoogleFonts.ebGaramond(
                textStyle: TextStyle(fontWeight: FontWeight.w600),
                color: Colors.black)),
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                children: <Widget>[
                  logo,
                  SizedBox(height: 10.0),
                  Text("Email",
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(height: 15.0),
                  email,
                  SizedBox(height: 10.0),
                  Text("Password",
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(height: 15.0),
                  password,
                  SizedBox(height: 24.0),
                  loginButton,
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RegisterPage()),
                          (Route<dynamic> route) => false);
                    },
                    elevation: 0.0,
                    color: Colors.white70,
                    child:
                        Text("Register", style: TextStyle(color: Colors.black)),
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

  signin(String email, pass) async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': pass};
    var jsonResponse = null;
    var response = await http.post(
        Uri.parse("https://109project.azurewebsites.net/member/login"),
        body: data);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        _currentUser = jsonResponse['token'];
        SharedPreferencesUtil.saveData<String>("token", _currentUser);
        var sp = SharedPreferencesUtil.getData<String>('token');
        print(sp);
        print(_currentUser);
        setState(() {
          _savedValue = _currentUser;
        });
        //sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => Home()),
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
