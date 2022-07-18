import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {
  final String moSalahUrl =
      "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/23/thumb_122243_default_news_size_5.jpeg";

  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildCustomAppBar(),
                const SizedBox(height: 15),
                buildSerachItem(),
                const SizedBox(height: 15),
                buildYourStoryAndOnlineFriends(),
                const SizedBox(height: 15),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
                buildChatItem(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatItem(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(moSalahUrl),
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12,
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Mohammed Salah",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        "You : Hello, how are you  how are you ",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "8:42 pm",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 8,
          ),
        ],
      ),
    );
  }

  Widget buildYourStoryAndOnlineFriends() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          buildAddToYourStoryItem(),
          const SizedBox(width: 10),
          buildYourStoryItem(),
          buildOnlineFriends(),
          buildOnlineFriends(),
          buildOnlineFriends(),
          buildOnlineFriends(),
          buildOnlineFriends(),
          buildOnlineFriends(),
          buildOnlineFriends(),
        ],
      ),
    );
  }

  Widget buildAddToYourStoryItem() {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Your Story",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildYourStoryItem() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.grey,
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(moSalahUrl),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Your Story",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildOnlineFriends() {
    return Container(
      width: 70,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(moSalahUrl),
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12,
              ),
              const CircleAvatar(
                backgroundColor: Colors.green,
                radius: 10,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Mohammed Salah",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSerachItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: const InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none),
      ),
    );
  }

  Widget buildCustomAppBar() {
    return Row(
      children: [
        buildProfilePicture(),
        const SizedBox(width: 10),
        const Text(
          "Chats",
          style: TextStyle(
            fontSize: 33,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        buildTopIconButton(Icons.camera_alt_rounded),
        const SizedBox(width: 10),
        buildTopIconButton(Icons.edit),
      ],
    );
  }

  Widget buildProfilePicture() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(moSalahUrl),
        ),
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 12,
        ),
        const CircleAvatar(
          backgroundColor: Colors.red,
          radius: 10,
          child: Text("2"),
        ),
      ],
    );
  }

  Widget buildTopIconButton(IconData iconData) {
    return CircleAvatar(
      backgroundColor: Colors.grey[300],
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}
