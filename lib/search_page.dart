import 'package:flutter/material.dart';
import 'package:instagram_clone/create_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  final User user;

  const SearchPage(this.user, {Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePage(widget.user)));
        },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildBody() {
    return Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('post').snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var items = snapshot.data?.docs ?? [];

            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1, mainAxisSpacing: 1, crossAxisSpacing: 1),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildListItem(context, items[index]);
                });
          },
    ));
  }

  Widget _buildListItem(BuildContext context, document) {
    return Image.network(document['photoUrl'], fit: BoxFit.cover);
  }
}
