import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';

import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String textMessage) async {
    final newMessage = Message(text: textMessage, fromWho: FromWho.me);

    if (newMessage.text.trim().isEmpty) return;

    messageList.add(newMessage);

    if (textMessage.trim().endsWith('?')) {
      friendReply();
    }

    notifyListeners();
    moveScrollToBotton();
  }

  Future<void> friendReply() async {
    final friendMessage = await getYesNoAnswer.getAnswer();

    messageList.add(friendMessage);

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
