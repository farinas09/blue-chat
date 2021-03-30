import 'package:chat_app/routes/routes.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChatApp',
      initialRoute: 'sign_in',
      routes: appRoutes,
    );
  }
}
