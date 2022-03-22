import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreatePage extends StatefulWidget {
  final User user;

  const CreatePage(this.user, {Key? key}) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  File? _image;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            // final firebaseStorageRef =
            //     FirebaseStorage.instance.ref().child('post').child('${DateTime.now().microsecondsSinceEpoch}.png');

            final firebaseStorageRef = FirebaseStorage.instance
                .ref()
                .child('post')
                .child('${DateTime.now().millisecondsSinceEpoch}.png');
            print('${DateTime.now().millisecondsSinceEpoch}.png');

            final task = firebaseStorageRef.putFile(_image!, SettableMetadata(contentType: 'image/png'));
            task.then((value) {
              var downloadUrl = value.ref.getDownloadURL();
              downloadUrl.then((uri) {
                var doc = FirebaseFirestore.instance.collection('post').doc();
                doc.set({
                  'id': doc.id,
                  'photoUrl': uri.toString(),
                  'email': widget.user.email,
                  'display': widget.user.displayName,
                  'userPhotoUrl': widget.user.photoURL,
                  'contents': textEditingController.text
                }).then((onValue) {
                  Navigator.pop(context);
                });
              });
            });
          },
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _image == null ? Text('No Image') : Image.file(_image!),
          TextField(
            decoration: InputDecoration(hintText: '내용을 입력하세요'),
            controller: textEditingController,
          )
        ],
      ),
    );
  }

  final ImagePicker picker = ImagePicker();

  Future _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
