// Message List Screen
class MessageListScreen extends StatefulWidget {
  const MessageListScreen({super.key});

  @override
  State<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  final List<Message> allMessages = [
    Message(sender: 'Ganesh', message: 'Missed call...', time: '6:06 pm', avatarColor: Colors.red),
    Message(sender: 'Kalpak', message: 'Missed call...', time: '8:36 am', avatarColor: Colors.blue),
  ];

  void openMessage(Message message) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MessageDetailScreen(message: message)),
    );
  }

  void startNewChat() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  void changeProfilePicture() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MessageSearchDelegate(allMessages));
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: changeProfilePicture,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: allMessages.length,
        itemBuilder: (context, index) {
          final message = allMessages[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: message.avatarColor,
              child: Text(message.sender[0].toUpperCase(), style: const TextStyle(color: Colors.white)),
            ),
            title: Text(message.sender),
            subtitle: Text(message.message, overflow: TextOverflow.ellipsis),
            onTap: () => openMessage(message),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: startNewChat,
        icon: const Icon(Icons.chat),
        label: const Text('Start Chat'),
      ),
    );
  }
}