import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final Function callback;
  final String text;

  const SubmitButton({Key key, this.callback, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          shape: StadiumBorder(),
        ),
        onPressed: callback,
        child: Container(
          width: double.infinity,
          height: 50,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
