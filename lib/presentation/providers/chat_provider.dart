import 'package:flutter/material.dart';

import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
    Message(text: 'Hola Mundo', fromWho: FromWho.me),
    Message(text: 'Cómo te va?', fromWho: FromWho.me)
  ];

  Future<void> sendMessage(String textMessage) async {
    if (textMessage.trim().isNotEmpty) return;
    final newMessage = Message(text: textMessage, fromWho: FromWho.me);

    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> moveScrollToBotton() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
