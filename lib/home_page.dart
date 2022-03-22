import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Instagram에 오신 것을 환영합니다.',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text('사진과 동영상을 보려면 팔로우하세요.'),
                Padding(padding: EdgeInsets.all(16)),
                SizedBox(
                  width: 260,
                  child: Card(
                      elevation: 4,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  user.photoURL!),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(8)),
                          Text(
                            user.email!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(user.displayName!),
                          Padding(padding: EdgeInsets.all(8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://w.namu.la/s/769f7881c5e77c95d7dafa7cf152711b8211a9f926d9dc4e71e0381bc79fe764883e1e6c2c178e06d6cb4b4974ff9bb94bbce5f8526ef1229f586f6a4bfc4ce057032951c72f690bee58f62631a70b2d7ee591a6bc12854a97e2e3ba845de0f3',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://w.namu.la/s/769f7881c5e77c95d7dafa7cf152711b8211a9f926d9dc4e71e0381bc79fe764883e1e6c2c178e06d6cb4b4974ff9bb94bbce5f8526ef1229f586f6a4bfc4ce057032951c72f690bee58f62631a70b2d7ee591a6bc12854a97e2e3ba845de0f3',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(1)),
                              SizedBox(
                                width: 70,
                                height: 70,
                                child: Image.network(
                                  'https://w.namu.la/s/769f7881c5e77c95d7dafa7cf152711b8211a9f926d9dc4e71e0381bc79fe764883e1e6c2c178e06d6cb4b4974ff9bb94bbce5f8526ef1229f586f6a4bfc4ce057032951c72f690bee58f62631a70b2d7ee591a6bc12854a97e2e3ba845de0f3',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(4)),
                          Text('Facebook 친구'),
                          Padding(padding: EdgeInsets.all(4)),
                          RaisedButton(
                            onPressed: () {},
                            child: Text('팔로우'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
