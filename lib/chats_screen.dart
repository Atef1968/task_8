import 'package:flutter/material.dart';
import 'resources.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,

        // ← FIXED BACK BUTTON
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // <-- Go back to HomeScreen
          },
        ),

        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: const AssetImage(
                "assets/images/account_owner.avif",
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              "Chats",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: const [
          Icon(Icons.camera_alt_outlined, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.edit_outlined, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: Column(
        children: [
          // Search bar
          Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              children: [
                Icon(Icons.search, color: Colors.black54),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Resources.chatImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(
                          Resources.chatImages[index],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        Resources.chatNames[index],
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Chat list
          Expanded(
            child: ListView.builder(
              itemCount: Resources.chatImages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(Resources.chatImages[index]),
                  ),
                  title: Text(
                    Resources.chatNames[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text("How Are You ?"),
                  trailing: const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [Text("02:30"), Icon(Icons.done_all, size: 18)],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
