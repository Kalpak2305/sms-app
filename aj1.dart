// Message Detail Screen
class MessageDetailScreen extends StatelessWidget {
  final Message message;
  const MessageDetailScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(message.sender)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(message.message),
      ),
    );
  }
}