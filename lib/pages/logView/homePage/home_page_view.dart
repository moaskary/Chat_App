import 'package:flutter/material.dart';
import 'package:minichatapp/services/auth/auth_service.dart';
import 'package:minichatapp/core/my_drawer.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  void logout() {
    //get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          //logout button
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
