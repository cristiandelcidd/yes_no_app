import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/widgets/chat/friend_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.cloudflare.steamstatic.com/steamcommunity/public/images/avatars/7e/7ef149dca5fe7262e756125078cbf8db9c24815f.jpg'),
          ),
        ),
        title: const Text('Amigo 😃'),
        centerTitle: false,
      ),
      body: _CharView(),
    );
  }
}

class _CharView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChatProvider chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (BuildContext context, int index) {
                  final message = chatProvider.messageList[index];

                  return message.fromWho == FromWho.me
                      ? MyMessageBubble(myMessage: message)
                      : FriendMessageBubble(friendMessage: message);
                },
              ),
            ),
            MessageFieldBox(
                // onValue: (value) => chatProvider.sendMessage(value)
                onValue: chatProvider.sendMessage)
          ],
        ),
      ),
    );
  }
}
