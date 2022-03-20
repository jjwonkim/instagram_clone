import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchPage extends StatefulWidget {
  // final User user;
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage()));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 1, crossAxisSpacing: 1),
        itemCount: 5,
        itemBuilder: (context, index) {
          return _buildListItem(context, index);
        });
  }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network(
        'https://w.namu.la/s/769f7881c5e77c95d7dafa7cf152711b8211a9f926d9dc4e71e0381bc79fe764883e1e6c2c178e06d6cb4b4974ff9bb94bbce5f8526ef1229f586f6a4bfc4ce057032951c72f690bee58f62631a70b2d7ee591a6bc12854a97e2e3ba845de0f3',
        fit: BoxFit.cover);
  }
}
