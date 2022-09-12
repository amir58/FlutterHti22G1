import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hti22one/assets_screen.dart';
import 'package:hti22one/auth/auth_cubit.dart';
import 'package:hti22one/bmi/bmi.dart';
import 'package:hti22one/contacts/contacts_cubit.dart';
import 'package:hti22one/contacts/contacts_main_screen.dart';
import 'package:hti22one/contacts_screen.dart';
import 'package:hti22one/messenger/messenger_screen.dart';
import 'package:hti22one/models/MyPost.dart';
import 'package:hti22one/models/news/NewsResponse.dart';
import 'package:hti22one/stack.dart';
import 'package:hti22one/auth/login_screen.dart';
import 'package:rxdart/subjects.dart';

import 'counter_cubit/counter_cubit_screen.dart';
import 'names_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  initLocalNotifications();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      String title = message.notification!.title ?? "";
      String body = message.notification!.body ?? "";

      String payload = jsonEncode(message.data);

      _showNotification(title, body, payload);
    }
  });

  FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
    String payload = jsonEncode(message.data);

    _showNotification(
        message.notification!.title!, message.notification!.body!, payload);
  });

  getNews("eg", "business");
  getNews("eg", "sports");

  runApp(MyApp());
}

void getNews(String country, String category) async {
  try {
    var response = await Dio().get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        "country":country,
        "category":category,
        "apiKey" : "fa72aea7f1af46a6a45be8aa23e21b64"
      }
    );
    print('RESPONSE => $response');

    NewsResponse newsResponse = NewsResponse.fromJson(response.data);
    print('Articles ( News ) => ${newsResponse.articles.length}');

    print('--------------------');
    for (var article in newsResponse.articles) {
      print('Title => ${article.title}');
    }
  } catch (e) {
    print(e);
  }
}

void getPosts() async {
  try {
    var response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts/2');
    // print("RESPONSE => $response");
    // print(response.data['userId']);
    // print(response.data['id']);
    // print(response.data['title']);
    // print(response.data['body']);

    MyPost post = MyPost.fromJson(response.data);
    print(post.title);
    print(post.body);
    print(post.toJson());
  } catch (e) {
    print(e);
  }
}

void initLocalNotifications() async {
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    print('PAYLOAD => $payload');

    var data = json.decode(payload!);

    print(data['postId']);

    // Navigator.push
  });
}

Future<void> _showNotification(
    String title, String body, String payload) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'defaultNotifications',
    'Default Notifications',
    channelDescription: 'your channel description',
    importance: Importance.max,
    priority: Priority.high,
    ticker: 'ticker',
  );

  const NotificationDetails platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );

  await flutterLocalNotificationsPlugin.show(
    0,
    null,
    body,
    platformChannelSpecifics,
    payload: payload,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('App RUN');
    return MaterialApp(
      title: 'Flutter Demo',
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.brown),
      themeMode: ThemeMode.light,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit()),
          BlocProvider(create: (_) => ContactsCubit()),
        ],
        child: FirebaseAuth.instance.currentUser == null
            ? LoginScreen()
            : ContactsMainScreen(),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      // drawer: Drawer(
      //     child: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           "First",
      //           style: textStyle,
      //         ),
      //         Text(
      //           "Second",
      //           style: textStyle,
      //         ),
      //         Text(
      //           "Third",
      //           style: textStyle,
      //         ),
      //       ],
      //     ),
      //   ),
      // )),
      appBar: AppBar(
        title: Text(
          "HTI App",
        ),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.green,
        elevation: 10,
        actions: [
          IconButton(
            onPressed: () {
              print('Search');
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Notifications');
            },
            icon: const Icon(
              Icons.notifications_active,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Logout');
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  alignment: AlignmentDirectional.topCenter,
                  child: Text("First", style: textStyle),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.green,
                  width: double.infinity,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Second",
                    style: textStyle,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  width: double.infinity,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Third",
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  FirstScreen() {}

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int counter = 0;

  _FirstScreenState() {
    print('_FirstScreenState');
  }

  @override
  void initState() {
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
        centerTitle: false,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          counter++;
          print(counter);
          setState(() {});
        },
      ),
      body: Center(
        child: Text(
          "Counter : $counter",
          style: const TextStyle(fontSize: 44, color: Colors.blue),
        ),
      ),
    );
  }
}
