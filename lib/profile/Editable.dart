import 'package:flutter/material.dart';
import 'package:lf_test/profile/profile.dart';
import 'package:lf_test/profile/user.dart';

class Editable extends StatefulWidget {
  User user;

  Editable(this.user);
  @override
  State<Editable> createState() => _EditableState();
}

class _EditableState extends State<Editable> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dob = TextEditingController();
  TextEditingController address = TextEditingController();
  late String p;
  // static var s=7;
  final _formKey =GlobalKey<FormState>();

  initState(){
    if(widget.user.name != null){
      name.text = widget.user.name!;
    }
    if(widget.user.phone != null){
      phone.text = widget.user.phone!;
    }
    if(widget.user.email != null){
      email.text = widget.user.email!;
    }
    if(widget.user.dob != null){
      dob.text = widget.user.dob!;
    }
    if(widget.user.address != null){
      address.text = widget.user.address!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.grey[850],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  // initialValue: (widget.user.name==null)?null:widget.user.name,
                  style: TextStyle(color: Colors.red),
                  controller: name,
                  decoration: InputDecoration(hintText: 'Enter the name',
                    prefixIconConstraints: const BoxConstraints(minWidth: 45),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.red,
                      size: 22,
                    ),
                    border: InputBorder.none,
                      hintStyle:
                      const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.red))
                  ),
                                    ///

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  controller: dob,
                  // decoration: const InputDecoration(
                  //   border: OutlineInputBorder(),
                  //   hintText: 'Enter the name',
                  // ),
                  //////
                  // style: TextStyle(color: Colors.pink, fontSize: 14.5),
                  decoration: InputDecoration(hintText: 'Enter the dob',
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.date_range_outlined,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintStyle:
                      const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.red))
                  ),
                  ///

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  controller: address,
                  // decoration: const InputDecoration(
                  //   border: OutlineInputBorder(),
                  //   hintText: 'Enter the name',
                  // ),
                  //////
                  // style: TextStyle(color: Colors.pink, fontSize: 14.5),
                  decoration: InputDecoration(hintText: 'Enter the address',
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.home_filled,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintStyle:
                      const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.red))
                  ),
                  ///

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  controller: email,
                  decoration: InputDecoration(hintText: 'Enter the email',
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintStyle:
                      const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.red))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: TextFormField(
                  style: TextStyle(color: Colors.red),
                  controller: phone,
                  decoration: InputDecoration(hintText: 'Enter the phone no.',
                      prefixIconConstraints: const BoxConstraints(minWidth: 45),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.red,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      hintStyle:
                      const TextStyle(color: Colors.red, fontSize: 14.5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.redAccent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(color: Colors.red))
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child:
                GestureDetector(

                  onTap: () {
                    if (_formKey.currentState!.validate()){
                      widget.user.name = name.text;
                      widget.user.dob = dob.text;
                      widget.user.address = address.text;
                      widget.user.email = email.text;
                      widget.user.phone = phone.text;
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Profile(widget.user)),
                      );
                    }
                  },

                  child: Container(

                    height: 53,

                    width: double.infinity,

                    margin: const EdgeInsets.symmetric(horizontal: 30),

                    alignment: Alignment.center,

                    decoration: BoxDecoration(

                        boxShadow: [

                          BoxShadow(

                              blurRadius: 4,

                              color: Colors.black12.withOpacity(.2),

                              offset: const Offset(2, 2))

                        ],

                        borderRadius: BorderRadius.circular(100),

                        gradient: LinearGradient(colors: [

                          Colors.orange.shade200,

                          Colors.orange.shade900

                        ])),

                    child: Text('Submit',

                        style: TextStyle(

                            color: Colors.white.withOpacity(.8),

                            fontSize: 15,

                            fontWeight: FontWeight.bold)),

                  ),

                ),
                // ElevatedButton(
                //   onPressed: () {
                //     user.name=name.text;
                //     user.email=email.text;
                //     user.phone=phone.text;
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) =>  Profile(user)),
                //     );
                //   },
                //   child: const Text('Submit'),
                // ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
