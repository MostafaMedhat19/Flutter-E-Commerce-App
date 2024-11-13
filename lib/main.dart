import 'package:flutter/material.dart';
import 'package:mostafamedhatmostafa0522019/proviedrs/account_provider.dart';
import 'package:mostafamedhatmostafa0522019/screens/registration_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=> AccountProvider())
    ], child: MaterialApp(
            home: RegistrationPage(),
      debugShowCheckedModeBanner: false,
    ),);
  }
}

