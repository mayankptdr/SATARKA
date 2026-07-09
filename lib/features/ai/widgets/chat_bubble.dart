import 'package:flutter/material.dart';

import '../model/chat_message.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chat;

  const ChatBubble({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: chat.isUser ? Alignment.centerRight : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),

        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),

        decoration: BoxDecoration(
          color: chat.isUser
              ? const Color(0xFF2563EB)
              : const Color(0xFFF1F5F9),

          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(chat.isUser ? 18 : 4),
            bottomRight: Radius.circular(chat.isUser ? 4 : 18),
          ),
        ),

        child: Text(
          chat.message,
          style: TextStyle(
            fontSize: 15,
            color: chat.isUser ? Colors.white : Colors.black87,
            height: 1.45,
          ),
        ),
      ),
    );
  }
}
