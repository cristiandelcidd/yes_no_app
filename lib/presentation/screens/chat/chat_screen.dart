import 'package:flutter/material.dart';

import 'package:yes_no_app/presentation/widgets/chat/friend_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return index % 2 == 0
                      ? const MyMessageBubble()
                      : const FriendMessageBubble();
                },
              ),
            ),
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
