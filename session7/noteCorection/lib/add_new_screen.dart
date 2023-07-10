import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gggg/main.dart';

class AddNewNoteScreen extends StatefulWidget {
  const AddNewNoteScreen({super.key});

  @override
  State<AddNewNoteScreen> createState() => _AddNewNoteScreenState();
}

class _AddNewNoteScreenState extends State<AddNewNoteScreen> {
  final noteController = TextEditingController();

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
              style: const TextStyle(color: Colors.white),
              controller: noteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Note",
                hintText: "Enter Your Note",
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                onPressed: () => addnote(),
                child: const Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }

  addnote() {
    {
      String note = noteController.text;

      String currentMillis = DateTime.now().millisecondsSinceEpoch.toString();

      Map<String, dynamic> data = {
        "id": currentMillis,
        "note": note,
      };
      firestore.collection("notes").doc(data["id"]).set(data);
      Navigator.pop(context);
    }
  }
}
