import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountPage extends StatefulWidget {
  final User user;

  const AccountPage(this.user, {Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
            },
            icon: Icon(Icons.exit_to_app))
      ],
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        // mainAxisAlignment:,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.user.photoURL!),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.bottomRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              Text(
                widget.user.displayName!,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
          Text(
            '0\n게시물',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '0\n팔로워',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            '0\n팔로잉',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
