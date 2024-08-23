import 'package:digtal_lock/lockhome.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_core/firebase_core.dart';
void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(digital_lock());
}

class digital_lock extends StatelessWidget {
  const digital_lock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: lockhome(),
    );
  }
}
