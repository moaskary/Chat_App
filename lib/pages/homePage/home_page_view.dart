import 'package:flutter/material.dart';
import 'package:minichatapp/core/my_drawer.dart';
import 'package:minichatapp/core/user_tile.dart';
import 'package:minichatapp/pages/chatview/chat_page_view.dart';
import 'package:minichatapp/services/auth/auth_service.dart';
import 'package:minichatapp/services/chat/chat_services.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});

  //chat & auth service
  final ChatServices _chatServices = ChatServices();
  final AuthService _authService = AuthService();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  //build a list user except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatServices.getUsersStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
        //return list view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual  list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          //tapped on a user -> go to chat page
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPageView(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
