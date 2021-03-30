import 'dart:io';

import 'package:chat_app/widgets/chat_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _messageController = TextEditingController();
  final _focusNode = new FocusNode();
  bool writing = false;
  List<ChatItem> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              child: Text(
                'T',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Name',
                  style: TextStyle(fontSize: 18, color: Colors.black54)),
              Text('Active now',
                  style: TextStyle(fontSize: 14, color: Colors.black45)),
            ])
          ],
        ),
      ),
      body: Container(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return _messages[index];
              },
            ),
          ),
          Divider(),
          _inputChat()
        ]),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: 50,
        child: Row(
          children: [
            Flexible(
              child: TextField(
                controller: _messageController,
                onSubmitted: _onSubmit,
                onChanged: (value) {
                  setState(() {
                    writing = value.trim().length > 0 ? true : false;
                  });
                },
                decoration:
                    InputDecoration.collapsed(hintText: 'Type a message'),
                focusNode: _focusNode,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS
                  ? CupertinoButton(
                      child: Text('Send'),
                      onPressed: writing
                          ? () => _onSubmit(_messageController.text)
                          : null,
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                        color: Colors.blue,
                        disabledColor: Colors.grey,
                        icon: Icon(Icons.send),
                        onPressed: writing
                            ? () => _onSubmit(_messageController.text)
                            : null,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }

  _onSubmit(String message) {
    print(message);
    _focusNode.requestFocus();
    if (message.length > 0) {
      _messageController.clear();
      final _chatItem = ChatItem(
        animationController: AnimationController(
            vsync: this, duration: Duration(milliseconds: 200)),
        userId: '123',
        text: message,
      );
      _messages.insert(0, _chatItem);
      _chatItem.animationController.forward();

      setState(() {
        writing = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: off socket
    for (ChatItem item in _messages) {
      item.animationController.dispose();
    }
    super.dispose();
  }
}
