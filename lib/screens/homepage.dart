// import 'dart:html';

import 'package:firebasecrud/screens/add_information.dart';
import 'package:firebasecrud/screens/list_view_infor.dart';
import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Crud With Firebase"),
            ElevatedButton(
              onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AddInformation()));},
               child: Text("Create",style: TextStyle(fontSize: 20),),
               style: ElevatedButton.styleFrom(primary:Colors.deepPurple),
               )
          ],
        ),
      ),
      body: ListViewInformation(),
    );
  }
}