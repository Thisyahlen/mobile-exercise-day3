import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {


  String? valueChoose;
  List ListGender =[
    "Male","Female","Other","Rather Not To Say"
  ];
  bool isButtonActive = true;
  late TextEditingController controller;

  void initState(){
    super.initState();

    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Form'),

      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25.0,),
                  Text('Welcome Degenerates',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 30.0)

                    ),
                  SizedBox(height: 25.0),
                  Image.asset("assets/images/degenerates.jpg",
                    height: 150.0,
                  width: 150.0,),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                      margin: EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.transparent)
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Name',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                    controller: controller,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    margin: EdgeInsets.only(top: 10.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: 'Password',
                        fillColor: Colors.grey[200],
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 5, right: 5),
                          decoration: BoxDecoration(
                           border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: DropdownButton(
                            hint: Text("Select Your Gender:"),
                            dropdownColor: Colors.white,
                            icon: Icon(Icons.arrow_drop_down),
                            isExpanded: true,
                            underline: SizedBox(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            value: valueChoose,
                            onChanged: (newValue){
                              setState(() {
                                valueChoose = newValue as String?;
                              });
                            },
                            items: ListGender.map((valueItem){
                              return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                              );
                  }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ElevatedButton(
                    child: Text('Submit'),
                    onPressed: isButtonActive? () {
                        setState(() => isButtonActive = false);
                        controller.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Sign Up Success. Your data is MINE !.... HAHAHHAA'),
                          ),
                        );
                    }: null,
                  ),
                ],
              ),
            ),
          ),
      ),

    );
  }
}

