import 'package:flutter/material.dart';

void main() {
  runApp(const MessagesApp());
}

class MessagesApp extends StatelessWidget {
  const MessagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messages',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          elevation: 0,
        ),
      ),
      home: const MessageListScreen(),
    );
  }
}

// Message Model
class Message {
  final String sender;
  final String message;
  final String time;
  final Color avatarColor;
  int unreadCount;

  Message({
    required this.sender,
    required this.message,
    required this.time,
    required this.avatarColor,
    this.unreadCount = 0,
  });
}