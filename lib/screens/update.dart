import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasecrud/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateInformation extends StatefulWidget {
  const UpdateInformation({Key? key,required this.id}) : super(key: key);
    final String id;
    
  @override
  State<UpdateInformation> createState() => _UpdateInformationState();
}

class _UpdateInformationState extends State<UpdateInformation> {
  final _formKey = GlobalKey<FormState>();
  CollectionReference updat = FirebaseFirestore.instance.collection('Student');
 Future updateuser(id,name,email,password) async{
     return updat.doc(id)
      .update({'name':name,'email':email,'password':password}).then((value) => print("Updated"));
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child:FutureBuilder<DocumentSnapshot <Map<String,dynamic>>>(
          future: FirebaseFirestore.instance.collection('Student').doc(widget.id).get(),
        builder: (_, snapshot){
            if (snapshot.hasError) {print("error");}
            if (snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
             if(snapshot.hasData){
              var data = snapshot.data!.data();
             var name = data!['name'];
             var email = data['email'];
             var password = data['password'];
              return Container(
          margin: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  initialValue: name,
                  onChanged: (value){name = value;},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:"Name",
                    errorStyle: TextStyle(color: Colors.red,fontSize: 15),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  initialValue: email,
                  onChanged: (value){email = value;},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:"Email",
                    errorStyle: TextStyle(color: Colors.red,fontSize: 15),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please enter Email";
                    }
                    else if(!value.contains("@")){
                      return "Enter valiud email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: TextFormField(
                  initialValue: password,
                  onChanged: (value){password = value;},
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:"Password",
                    errorStyle: TextStyle(color: Colors.red,fontSize: 15),
                  ),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return "Please enter name";
                    }
                    return null;
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(onPressed: (){
                        if (_formKey.currentState!.validate()) {
                         
                        updateuser(widget.id,name,email,password);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                          ;
                        }
                    },
                     child: Text("Update"))
                  ),
                  ElevatedButton(onPressed: (){
                },
                 child: Text("Reset"))
                ],
              ),
              
            ],
          ),
        );
             }
             return Center(child: CircularProgressIndicator(),);
            // var name = data!['name'];
            
        }) 
      ),
    );
  }
}