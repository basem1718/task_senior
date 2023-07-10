import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gggg/main.dart';

class EditNoteScreen extends StatefulWidget {
  EditNoteScreen({super.key, required this.note, required this.id});

  final String note;
  final String id;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  final noteController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    noteController.text = widget.note;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text("Add new note"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.black),
              controller: noteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note",
                hintText: "Edit Your Note",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () => updateNote(),
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  updateNote() {
    String note = noteController.text;

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    Map<String, dynamic> data = {
      "note": note,
    };

    firestore.collection("notes").doc(widget.id).update(data);

    Navigator.pop(context, note);
  }
}
