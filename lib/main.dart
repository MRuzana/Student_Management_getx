import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_record_getx/functions/db_functions.dart';
import 'package:student_record_getx/screens/screen_list_details.dart';

Future <void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await openDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 126, 202, 128)
      ),
      home:  ListDetails(),
    );
    

  }
}