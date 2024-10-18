import 'package:flutter/material.dart';
import 'package:minichatapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(
      {super.key, required this.message, required this.isCurrentUser});
  final String message;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    //light vs dark mode for the correction buuble colors
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return Container(
      decoration: BoxDecoration(
        color: isCurrentUser ? (isDarkMode? Colors.blue.shade600 : Colors.blue.shade500) : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade500),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25),
      child: Text(
        message,
        style: TextStyle(color: isCurrentUser ? Colors.white : (isDarkMode ? Colors.white : Colors.black)),
      ),
    );
  }
}
