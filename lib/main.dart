import 'package:counterapp/post.dart';
import 'package:flutter/material.dart';
import 'network.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Post> postData = [];
  @override
  void initState() {
    super.initState();
    NetWorkRequest.fetchPost().then((dataFromSever) => {
          setState(() {
            postData = dataFromSever;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo rest API"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: postData.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${postData[index].title} /t ${postData[index].body}')
                      ],
                    ));
                  }))
        ],
      ),
    );
  }
}
