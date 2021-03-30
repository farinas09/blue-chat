import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image(image: AssetImage('assets/chat.png')),
            ),
            Text(
              'QuickServices',
              style: TextStyle(fontSize: 30, color: Colors.black87),
            )
          ],
        ),
      ),
    );
  }
}
