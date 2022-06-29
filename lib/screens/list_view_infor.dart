// import 'dart:ffi';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/screens/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

class ListViewInformation extends StatefulWidget {
  const ListViewInformation({Key? key}) : super(key: key);

  @override
  State<ListViewInformation> createState() => _ListViewInformationState();
}

class _ListViewInformationState extends State<ListViewInformation> {
  final Stream <QuerySnapshot> information = FirebaseFirestore.instance.collection('Student').snapshots();
    CollectionReference users = FirebaseFirestore.instance.collection('Student');
  Future delete(id)async{
    users .doc(id).delete();
  }
  
 
  @override

  Widget build(BuildContext context) { 
    return StreamBuilder<QuerySnapshot>(stream: information,
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
      if (snapshot.hasError) {return Text("Something went wrong");}
      if(snapshot.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      List datalist = [];
      // Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
      snapshot.data!.docs.map((DocumentSnapshot document) => {
           datalist.add(document.data() as Map<String ,dynamic>),

      }).toList();
      if (datalist.isEmpty) {
        
      return Center(child:Text("No Data Found",style: TextStyle(fontSize: 30,color: Colors.purple),));
      }
      
      // print(!snapshot.hasData);
      return  Container(
          
           margin: EdgeInsets.symmetric(horizontal: 8,vertical: 20),

           
           child: Table(
            defaultColumnWidth: FixedColumnWidth(80.0),  
                    border: TableBorder.all(  
                        color: Colors.black,  
                        style: BorderStyle.solid,  
                        width: 2), 
            children: [
              TableRow( children: [  
                        Column(children:[Text('id', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Name', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Email', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Password', style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text('Action', style: TextStyle(fontSize: 20.0))]),  
                      ]), 
                      for(var i = 0; i < datalist.length;i++) ...[
                      TableRow( children: [  
                        Column(children:[Text(datalist[i]["id"], style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text(datalist[i]["name"], style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text(datalist[i]["email"], style: TextStyle(fontSize: 20.0))]),  
                        Column(children:[Text(datalist[i]["password"], style: TextStyle(fontSize: 20.0))]),  
                        Column(
                          children:[
                            Wrap(
                              spacing: 0,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>UpdateInformation(id:datalist[i]['id'])));
                                  }, icon: Icon(Icons.update)),
                            IconButton(onPressed: (){delete(datalist[i]["id"]);}, icon: Icon(Icons.delete))
                              ],
                            )
                            ]),  
                      ])],  
            ],
           ),
         );
    });
    ;}} 
    //  StreamBuilder<QuerySnapshot>(
    //    stream: information,
    //    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
    //     if (snapshot.hasError) {return Text("Something went wrong");}
    //     if(snapshot.connectionState == ConnectionState.waiting){
    //      getDocs();
    //       print(snapshot.data);
    //       return Center(child: CircularProgressIndicator(),);
          
    //     }
        
        // 
        //
  