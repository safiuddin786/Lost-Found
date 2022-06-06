import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lf_test/modal/member.dart';
import 'package:lf_test/screens/wrapper.dart';
import 'package:lf_test/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Member?>.value(
      value: Auth().user,
      initialData: null,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Wrapper(),
      ),
    );
  }
}
