import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:something/pages/home_page.dart';
void main() async {

  //initialise Hive first step 1
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  // open hive storage as Box Step 2
   var box = await Hive.openBox('mybox');

  runApp(const MyApp()
  );
}
 class MyApp extends StatelessWidget {
   const MyApp({super.key});
 
   @override
   Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(primarySwatch: Colors.green),
     );
   }
 }