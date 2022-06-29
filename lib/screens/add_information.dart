import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/screens/homepage.dart';
import 'package:firebasecrud/screens/list_view_infor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({Key? key}) : super(key: key);

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final _formKey =  GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var id ="";
  var name ="";
  var email ="";
  var password ="";
    final users = FirebaseFirestore.instance.collection('Student').doc();
  Future useradd()async{
    users.set({
      'id':users.id,
      'name':name,
      'email':email,
      'password':password,
    }).then((value) => print("User added")).catchError((error)=>print("Failed to add user:$error"));
     return Navigator.push(context,MaterialPageRoute(builder: (context)=> Homepage()));
  }
  cleartext(){
    nameController.clear();
emailController.clear();
passwordController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Information"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(padding: EdgeInsets.symmetric(
          vertical: 30,horizontal: 30,),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name:",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color:Colors.red,fontSize: 15)
                  ),
                  controller: nameController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email:",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color:Colors.red,fontSize: 15)
                  ),
                  controller: emailController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    }else if(!value.contains("@")){
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password:",
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(color:Colors.red,fontSize: 15)
                  ),
                  controller: passwordController,
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please Enter password";
                    }
                    return null;
                  },
                ),
              ),
               Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(onPressed: (){
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          name= nameController.text;
                          email= emailController.text;
                          password= passwordController.text;
                          useradd();
                          cleartext();
                        });
                      }
                    }
                    , child: Text("Register")),
                     ElevatedButton(onPressed: (){
                     cleartext();
                    }
                    , child: Text("Reset"))
                  ],
                )
              ),
            ],
          ),
          )
      ),
    );
  }
}