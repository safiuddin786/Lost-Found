import 'package:flutter/material.dart';
import 'package:lf_test/services/auth.dart';
import 'package:lf_test/styles/authstyles.dart';

class Register extends StatefulWidget {
  final toggleWidget;

  const Register({Key? key, this.toggleWidget}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  String error = "";
  final formKey = GlobalKey<FormState>();
  final auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up Screen'),
          actions: [
            TextButton.icon(
                onPressed: widget.toggleWidget,
                icon: Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                label: Text(
                  'login',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: AuthStyle().textInput(text: "EMAIL"),
                    style: AuthStyle().textStyle(),
                    validator: (val) {
                      if (val == "")
                        return "This field is required";
                      else
                        return null;
                    },
                    onChanged: (val) => setState(() => email = val),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: AuthStyle().textInput(text: "PASSWORD"),
                    style: AuthStyle().textStyle(),
                    validator: (val) {
                      if (val == "")
                        return "This field is required";
                      else
                        return null;
                    },
                    obscureText: true,
                    onChanged: (val) => setState(() => password = val),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        dynamic result = await auth.register(email, password);
                        if (result == null) {
                          setState(
                              () => error = "Error while creating the user");
                        }
                      }
                    },
                    child: Text(
                      "REGISTER",
                      style: TextStyle(color: Colors.white, fontSize: 23.0),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blueAccent),
                        padding: MaterialStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 10.0))),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(
                        color: Colors.redAccent[200],
                        fontSize: 21.0),
                  )
                ],
              )),
        ));
  }
}
