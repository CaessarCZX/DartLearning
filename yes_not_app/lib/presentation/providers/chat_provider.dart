import 'package:flutter/material.dart';
import 'package:yes_not_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_not_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollCOntroller = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Hi darling', fromWho: FromWho.me),
    Message(text: 'Did you get back from work yet?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) herReply();
    notifyListeners();
    _moveScrollBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    _moveScrollBottom();
  }

  Future<void> _moveScrollBottom() async {
    await Future.delayed(const Duration(microseconds: 100));

    chatScrollCOntroller.animateTo(
      chatScrollCOntroller.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
