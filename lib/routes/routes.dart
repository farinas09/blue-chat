import 'package:flutter/material.dart';

import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/loading_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/pages/sign_in_page.dart';
import 'package:chat_app/pages/users_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'users': (_) => UsersPage(),
  'loading': (_) => LoadingPage(),
  'chat': (_) => ChatPage(),
  'register': (_) => RegisterPage(),
  'sign_in': (_) => SignInPage(),
};
