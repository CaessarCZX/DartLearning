import 'package:flutter/material.dart';
import 'package:yes_not_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_not_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_not_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://nicevoice.org/voices/avatar/billie-eilish.webp',
              ),
            ),
          ),
        ),
        title: Text('Mi amor ♥️'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return (index % 2 == 0)
                    ? HerMessageBubble()
                    : MyMessageBubble();
                },
              ),
            ),
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
