import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  final bool isSignIn;

  const Labels({Key key, @required this.isSignIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          isSignIn ? 'Don\'t have an account?' : 'Already have an account?',
          style: TextStyle(
              color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, isSignIn ? 'register' : 'sign_in');
          },
          child: Text(
            isSignIn ? 'Register now' : 'Login',
            style: TextStyle(
                color: Colors.blue[600],
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }
}
