import 'package:firebase_core/firebase_core.dart';
import 'package:firebasecrud/firebase_options.dart';
import 'package:firebasecrud/screens/homepage.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
runApp(const MyApp());
// Ideal time to initialize
//...
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
final Future<FirebaseApp> crudapp = Firebase.initializeApp();
    return FutureBuilder(future:crudapp,builder: (context,snapshot){
      if (snapshot.hasError) {print(snapshot.hasError);}
      if (snapshot.connectionState == ConnectionState.done) {
        return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Firebase crud",
        home: Homepage(),
    );
      } return CircularProgressIndicator();
    });
  }
}
 