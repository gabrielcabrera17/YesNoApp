import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {

  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/736x/d9/e1/ab/d9e1ab810ce86d89119e7e01cd8c182d.jpg'), 
          ),
        ),
        title: const Text('Mi Girasol'),
       // centerTitle: true,
      ),
      body:  GestureDetector(
      onTap: () {
         FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: _ChatView(),
      )
    );
  }
}

class _ChatView extends StatelessWidget {


 

  @override
  Widget build(BuildContext context) {

    //Referncia a nuestro provider
    final chatProvider = context.watch<ChatProvider>();
    

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
              Expanded(
                child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message,)
                    : MyMessageBubble(message: message,);

                },)),
            
            //caja de texto de mensajes
             MessageFielBox(
              onValue: chatProvider.sendMessage,
             ),
          ],
        ),
      ),
    );
  }
}