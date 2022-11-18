import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/pages/tentang.dart';
import 'package:flutter_application/pages/tambah_data.dart';
import 'package:flutter_application/pages/artikel.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _title() {
    return const Text(
      '',
      textAlign: TextAlign.center,
    );
  }

  Widget _nama() {
    return Text(
      "Alooo, Selamat Datang",
      style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    );
  }

  Widget _userUid() {
    return Text(user?.email ?? 'User email');
  }

  Widget _signOutButton() {
    return ElevatedButton(
      onPressed: signOut,
      child: const Text('Sign Out'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(
          child: _title(),
        ),
        leading: IconButton(
          onPressed: () {
            signOut();
          },
          icon: Icon(Icons.dashboard),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton(itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: signOut,
                child: Text("Logout"),
              )
            ];
          })
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            _nama(),
            _userUid(),
            Flexible(
                child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                // _nama(),
                // _userUid(),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    splashColor: Colors.pink,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.home_filled,
                            size: 70,
                            color: Colors.blue,
                          ),
                          Text("Home", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewsPage()));
                    },
                    splashColor: Colors.pink,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.article,
                            size: 70,
                            color: Colors.purple,
                          ),
                          Text("Berita", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InsertData()));
                    },
                    splashColor: Colors.pink,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.account_box_rounded,
                            size: 70,
                            color: Colors.teal,
                          ),
                          Text("Data Tamu", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => tentang()));
                    },
                    splashColor: Colors.pink,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Icon(
                            Icons.help,
                            size: 70,
                            color: Colors.yellow,
                          ),
                          Text("Tentang", style: TextStyle(fontSize: 17.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
