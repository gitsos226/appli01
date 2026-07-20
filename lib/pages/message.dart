import "package:flutter/material.dart";

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('page des messages'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
