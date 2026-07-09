import 'package:flutter/material.dart';

import '../../../core/services/api_service.dart';
import '../model/chat_message.dart';
import '../widgets/chat_bubble.dart';
import '../widgets/chat_input.dart';

class AIChatScreen extends StatefulWidget {
  final String? initialPrompt;

  const AIChatScreen({super.key, this.initialPrompt});

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<ChatMessage> _messages = [
    ChatMessage(
      message:
          "👋 Hello! I'm SATARKA AI.\n\nHow can I help you with your health today?",
      isUser: false,
    ),
  ];

  bool _isLoading = false;
  bool _initialPromptSent = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sendInitialPrompt();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _sendInitialPrompt() async {
    if (widget.initialPrompt == null) return;

    if (_initialPromptSent) return;

    _initialPromptSent = true;

    _controller.text = widget.initialPrompt!;

    await _sendMessage();
  }

  Future<void> _sendMessage() async {
    if (_controller.text.trim().isEmpty) return;

    final userMessage = _controller.text.trim();

    setState(() {
      _messages.add(ChatMessage(message: userMessage, isUser: true));

      _isLoading = true;
    });

    _controller.clear();

    _scrollToBottom();

    try {
      final reply = await ApiService.sendMessage(userMessage);

      setState(() {
        _messages.add(ChatMessage(message: reply, isUser: false));
      });
    } catch (e) {
      setState(() {
        _messages.add(
          ChatMessage(
            message: "❌ Unable to connect to SATARKA AI.\nPlease try again.",
            isUser: false,
          ),
        );
      });
    }

    setState(() {
      _isLoading = false;
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 200), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SATARKA AI"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(chat: _messages[index]);
              },
            ),
          ),
          ChatInput(
            controller: _controller,
            onSend: _sendMessage,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }
}
