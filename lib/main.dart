import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:giveandgetblood/screensUse/login.dart';



//เมื่อโปรเจ็คทงาน Constructor Method หรือเม็ธตอดหลักทำการ call object จากคลาสตัวล่าง
void main() async {
  // these 2 lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //
  runApp(MyApp());
}
//class ตัวนี้ดึง widget ที่มาจาก home มาแสดง
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.orange),
      debugShowCheckedModeBanner: false,
      title: 'Get&Give Blood',
      home: Login(),//เริ่มต้นRun
    );
  }
}