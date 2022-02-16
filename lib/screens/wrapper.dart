import 'package:flutter/material.dart';
import 'package:lf_test/modal/member.dart';
import 'package:lf_test/screens/homescreen.dart';
import 'package:lf_test/screens/toggle.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Member?>(context)?? null;
    print(user);
    if(user == null) return ToggleAuth();
    else return Home();
  }
}
