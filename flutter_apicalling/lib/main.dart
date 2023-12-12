import 'package:flutter/material.dart';
import 'package:flutter_apicalling/modal/post.dart';
import 'package:flutter_apicalling/post_full.dart';
import 'package:flutter_apicalling/service/postapiservices.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PostService apiService = PostService();
  List<Post> lexicaList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await apiService.getPhotos();
      setState(() {
        lexicaList = data;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, // change your color here
          ),
          title: Text(
            'Lexica Images',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: lexicaList.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: lexicaList.length,
                itemBuilder: (context, index) {
                  final post = lexicaList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PostFull(
                              lexicaList: lexicaList, index: index),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.network(post.image,height: 150,width: MediaQuery.of(context).size.width,),
                        Text(post.id.toString()),
                      ],
                    ),
                  );
                }
                )
    );
  }
}
