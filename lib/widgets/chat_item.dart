import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String text;
  final String userId;
  final AnimationController animationController;

  const ChatItem(
      {Key key,
      @required this.text,
      @required this.userId,
      @required this.animationController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationController,
      child: SizeTransition(
        sizeFactor:
            CurvedAnimation(parent: animationController, curve: Curves.easeIn),
        child: Container(
            child: this.userId == '123' ? _myMessage() : _notMyMessage()),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 5, left: 50, right: 12),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _notMyMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.only(bottom: 5, left: 12, right: 50),
        child: Text(
          text,
          style: TextStyle(color: Colors.black87),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
