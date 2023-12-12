import 'package:flutter/material.dart';
import 'package:flutter_apicalling/modal/post.dart';

class PostFull extends StatefulWidget {
  PostFull({Key? key, required this.lexicaList, required this.index})
      : super(key: key);
  List<Post> lexicaList;
  int index;

  @override
  State<PostFull> createState() => _PostFullState();
}

class _PostFullState extends State<PostFull> {
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
      body: Column(
        children: [
          Image.network(
            widget.lexicaList[widget.index].image,
            height: 150,
            width: MediaQuery.of(context).size.width,
          ),
          Text(widget.lexicaList[widget.index].id.toString()),
        ],
      ),
    );
  }
}
