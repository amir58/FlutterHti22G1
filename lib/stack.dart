import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(width: 300, height: 300, color: Colors.black),
                  Container(width: 250, height: 250, color: Colors.blue),
                  Container(width: 200, height: 200, color: Colors.red),
                  Container(width: 150, height: 150, color: Colors.green),
                  const Positioned(
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 16,
                      )),
                ],
              ),
              // Image.network("https://i.ytimg.com/vi/wgTBLj7rMPM/maxresdefault.jpg"),

              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: const [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://d3j2s6hdd6a7rg.cloudfront.net/v2/uploads/media/default/0002/23/thumb_122243_default_news_size_5.jpeg",
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 18,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
