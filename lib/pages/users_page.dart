import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:chat_app/models/user.dart';

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final users = [
    User(id: '1', name: 'Jose', email: 'test@test.com', online: true),
    User(id: '2', name: 'Jennifer', email: 'test1@test.com', online: true),
    User(id: '3', name: 'Erick', email: 'test2@test.com', online: false),
    User(id: '4', name: 'Luis', email: 'test3@test.com', online: true),
    User(id: '1', name: 'Jose', email: 'test@test.com', online: true),
  ];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.check_circle, color: Colors.green),
              ),
              Text(
                'Chats',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          elevation: 2,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.exit_to_app, color: Colors.blue),
            ),
          ]),
      body: SmartRefresher(
        onRefresh: _loadUsers,
        enablePullDown: true,
        controller: _refreshController,
        child: usersListView(),
      ),
    );
  }

  ListView usersListView() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: users.length,
      separatorBuilder: (_, int i) => Divider(),
      itemBuilder: (_, int index) {
        return UserListItem(user: users[index]);
      },
    );
  }

  _loadUsers() async {
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}

class UserListItem extends StatelessWidget {
  const UserListItem({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.name),
      leading: CircleAvatar(
        backgroundColor: Colors.blue[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              user.name.substring(0, 1),
              style: TextStyle(color: Colors.white),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: 0,
              child: Icon(
                Icons.circle,
                size: 15,
                color: user.online ? Colors.green[400] : Colors.red[400],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
