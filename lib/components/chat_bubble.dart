import 'package:bubble/bubble.dart';
import 'package:chat_app/services/controller/login_auth.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final String userID;
  ChatBubble({super.key, required this.text, required this.userID});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final double px = 1 / MediaQuery.of(context).devicePixelRatio;
    
    if (userID != _authService.getCurrentUser()!.uid) {
      return Bubble(
        margin: const BubbleEdges.all(5),
        nip: BubbleNip.leftTop,
        elevation: 8 * px,
        alignment: Alignment.topLeft,
        child: Text(text),
      );
    } else {
      return Bubble(
        color: Colors.green[100],
        margin: const BubbleEdges.all(5),
        nip: BubbleNip.rightTop,
        elevation: 8 * px,
        alignment: Alignment.topRight,
        child: Text(text),
      );
    }
  }
}
