import 'package:chatt/constants.dart';
import 'package:chatt/models/message.dart';
import 'package:chatt/widgets/chat_Bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'chatPage';
  final _controller = ScrollController();

  CollectionReference messages = FirebaseFirestore.instance.collection(
    kmessagesCollection,
  );

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        //   FIX 1: Check loading first

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        //   FIX 2: Check if data == null
        if (!snapshot.hasData || snapshot.data == null) {
          return Scaffold(body: Center(child: Text("No messages found")));
        }

        //   FIX 3: Now it's safe to access snapshot.data
        List<Message> messagesList = [];

        for (int i = 0; i < snapshot.data!.docs.length; i++) {
          messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimatyColor,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/scholar.png', height: 50),
                SizedBox(width: 10),
                Text('Chat', style: TextStyle(color: Colors.white)),
              ],
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  controller: _controller,
                  itemCount: messagesList.length,
                  itemBuilder: (context, index) {
                    return messagesList[index].id == email
                        ? chat_Bubble(message: messagesList[index])
                        : chat_Bubble_friend(message: messagesList[index]);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: controller,
                  onSubmitted: (data) {
                    messages.add({
                      'message': data,
                      kCreatedAt: DateTime.now(),
                      'id': email,
                    });
                    controller.clear();
                    _controller.animateTo(
                      0,
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 500),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                    suffixIcon: Icon(Icons.send, color: kPrimatyColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: kPrimatyColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: kPrimatyColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
