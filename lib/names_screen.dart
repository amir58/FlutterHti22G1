import 'package:flutter/material.dart';

class NamesScreen extends StatelessWidget {
  NamesScreen({Key? key}) : super(key: key);
  final String moSalahUrl =
      "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/23/thumb_122243_default_news_size_5.jpeg";

  final List<String> names = [
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
    "Ahmed",
    "Mohammed",
    "Ali",
    "Mahmoud",
    "Ehab",
    "Mostafa",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Names"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Center(
              child: Text(
                names[index],
                style: const TextStyle(fontSize: 33),
              ),
            );
          },
          itemCount: names.length,
          scrollDirection: Axis.vertical,
        ),
      ),
    );
  }

  Widget buildChatItem() {
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
}
