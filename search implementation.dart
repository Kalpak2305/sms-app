class MessageSearchDelegate extends SearchDelegate {
  final List<Message> messages;
  MessageSearchDelegate(this.messages);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = messages.where((msg) {
      return msg.sender.toLowerCase().contains(query.toLowerCase()) ||
             msg.message.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final message = results[index];
        return ListTile(title: Text(message.sender), subtitle: Text(message.message));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}