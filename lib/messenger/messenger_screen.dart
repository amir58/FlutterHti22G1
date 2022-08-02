import 'package:flutter/material.dart';
import 'package:hti22one/messenger/my_circle_icon_button.dart';
import 'package:hti22one/messenger/my_search_view.dart';

import 'chat_model.dart';

class MessengerScreen extends StatelessWidget {
  MessengerScreen({Key? key}) : super(key: key);

  final String moSalahUrl =
      "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/23/thumb_122243_default_news_size_5.jpeg";
  final String imageUrl =
      "https://ichef.bbci.co.uk/news/976/cpsprodpb/15E47/production/_124717698_gettyimages-1395200655.jpg";

  List<ChatModel> chats = [];

  @override
  Widget build(BuildContext context) {
    initData();
    initData();
    initData();
    chats.shuffle();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              buildCustomAppBar(),
              const SizedBox(height: 15),
              MySearchView(
                onFieldSubmitted: (value) {
                  print('From messenger screen -> $value');
                },
              ),
              const SizedBox(height: 15),
              buildYourStoryAndOnlineFriends(),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (context, index) {
                    ChatModel chat = chats[index];

                    return buildChatItem(data: chat);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initData() {
    chats.add(ChatModel(
      moSalahUrl,
      "Ali",
      "How are you",
      "now",
      true,
      false,
    ));

    chats.add(ChatModel(
      imageUrl,
      "Ahmed",
      "Where are you",
      "5:45 pm",
      false,
      true,
    ));

    chats.add(ChatModel(
      moSalahUrl,
      "Mohamed",
      "call me ASAP",
      "yesterday",
      true,
      true,
    ));

    chats.add(ChatModel(
      imageUrl,
      "Amir",
      "I'm waiting you",
      "now",
      false,
      false,
    ));
  }

  Widget buildChatItem({required ChatModel data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(data.imageUrl),
              ),
              const CircleAvatar(
                backgroundColor: Colors.white,
                radius: 12,
              ),
              CircleAvatar(
                backgroundColor: data.online ? Colors.green : Colors.red,
                radius: 10,
              ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.username,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "You : ${data.message}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      data.dateTime,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Visibility(
            visible: data.seen,
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 8,
            ),
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
        MyCircleIconButton(
          iconData: Icons.camera_alt_rounded,
          onPressed: () {
            print('Camera');
          },
        ),
        const SizedBox(width: 10),
        MyCircleIconButton(
          iconData: Icons.edit,
          onPressed: () {
            print('Edit');
          },
        ),
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
}
