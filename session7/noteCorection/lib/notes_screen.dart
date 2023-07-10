import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gggg/add_new_screen.dart';
import 'package:gggg/edit.dart';
import 'package:gggg/login_screen.dart';

import 'constant/colors.dart';

class noteScreen extends StatefulWidget {
  noteScreen({super.key});

  @override
  State<noteScreen> createState() => _noteScreenState();
}

class _noteScreenState extends State<noteScreen> {
  final firestore = FirebaseFirestore.instance;

  getRondomColor() {
    Random random = Random();
    return backgroundColors[random.nextInt(backgroundColors.length)];
  }

  @override
  void initState() {
    super.initState();
    getNotesFromFirebaseFirestore();
  }

  void getNotesFromFirebaseFirestore() {
    firestore.collection("notes").get().then((value) {
      notes.clear();
      for (var document in value.docs) {
        final note = document.data();
        notes.add(note);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade900,
        centerTitle: true,
        title: const Text('Notes'),
      ),
      backgroundColor: Colors.grey.shade900,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey.shade700,
        onPressed: () => navigateToaddBlogScreen(),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: ((context, index) {
            print(index);
            return noteItems(index);
          })),
    );
  }

  navigateToaddBlogScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const AddNewNoteScreen(),
        )).then((value) {
      getNotesFromFirebaseFirestore();
    });
  }

  final List<Map<String, dynamic>> notes = [];

  Widget noteItems(int index) {
    return Container(
      margin: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getRondomColor(),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          children: [
            Expanded(
              child: Text(
                notes[index]['note'],
                style: const TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
            IconButton(
                onPressed: () {
                  navigatToEditeNoteScreen(index);
                },
                icon: const Icon(
                  Icons.edit,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () => deleteNote(index),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        ),
      ),
    );
  }

  void navigatToEditeNoteScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditNoteScreen(note: notes[index]['note'], id: notes[index]['id']),
      ),
    ).then((value) {
      getNotesFromFirebaseFirestore();
    });
  }

  deleteNote(int index) async {
    await firestore.collection("notes").doc(notes[index]['id']).delete();
    notes.removeAt(index);
    setState(() {});
  }
}
