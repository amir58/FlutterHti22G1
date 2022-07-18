import 'package:flutter/material.dart';
import 'package:hti22one/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: ThirdScreen(),
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
        title:  Text("HTI App",),
        leading: const Icon(Icons.info),
        backgroundColor: Colors.green,
        elevation:  10,

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

class FirstScreen extends StatelessWidget {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
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
          // setState((){});
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
