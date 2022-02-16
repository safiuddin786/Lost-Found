import 'package:flutter/material.dart';
import 'package:lf_test/screens/login.dart';
import 'package:lf_test/screens/register.dart';

class ToggleAuth extends StatefulWidget {
  const ToggleAuth({Key? key}) : super(key: key);
  @override
  _ToggleAuthState createState() => _ToggleAuthState();
}

class _ToggleAuthState extends State<ToggleAuth> {
  bool check = true;
  toggleSwitch(){
    setState(() {
      check = !check;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(check) return Login(toggleWidget: toggleSwitch);
    else return Register(toggleWidget: toggleSwitch);
  }
}
