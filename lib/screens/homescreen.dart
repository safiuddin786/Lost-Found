import 'package:flutter/material.dart';
import 'package:lf_test/modal/lost_found.dart';
import 'package:lf_test/screens/home/home_body.dart';
import 'package:lf_test/services/auth.dart';
import 'package:lf_test/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Auth();
    return Scaffold(
        body: StreamProvider<List<LostFound>>.value(
          initialData: [],
          value: DataBase().lostFound,
          child: HomeBody()
        ),
          );
  }
}
