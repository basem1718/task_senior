import 'package:flutter/material.dart';

void main() {
  runApp(const MassagesScreen());
}

class MassagesScreen extends StatefulWidget {
  const MassagesScreen({super.key});

  @override
  State<MassagesScreen> createState() => _MassagesScreenState();
}

class _MassagesScreenState extends State<MassagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            'Massages',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ListView(
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80'),
                child: Text('A'),
              ),
              title: Text('Alice'),
              subtitle: Text('Hello!'),
              trailing: Text('12:30 PM'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1419410282/photo/silent-forest-in-spring-with-beautiful-bright-sun-rays.jpg?s=2048x2048&w=is&k=20&c=t9_zg20wVbrBoGn0tw__1fFq4ykeKs15TQQ3x-ehVC0='),
                child: Text('B'),
              ),
              title: Text('Bob'),
              subtitle: Text('How are you?'),
              trailing: Text('11:45 AM'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/1443543154/photo/smiling-mature-woman-standing-in-a-park-outdoors-in-the-summertime.jpg?s=2048x2048&w=is&k=20&c=24S5Wx8BJgOn9aoaU4HT6oAIHFW2XLeeterGe8WzmwE='),
                child: Text('C'),
              ),
              title: Text('Charlie'),
              subtitle: Text('Thanks for your help!'),
              trailing: Text('10:15 AM'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80'),
                child: Text('D'),
              ),
              title: Text('Dave'),
              subtitle: Text('See you later!'),
              trailing: Text('9:00 AM'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pixlr.com/images/index/remove-bg.webp'),
                child: Text('D'),
              ),
              title: Text('Rem'),
              subtitle: Text('See you later!'),
              trailing: Text('9:00 AM'),
            ),
            Divider(),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://imgv3.fotor.com/images/slider-image/A-clear-image-of-a-woman-wearing-red-sharpened-by-Fotors-image-sharpener.jpg'),
                child: Text('D'),
              ),
              title: Text('Sara'),
              subtitle: Text('Where are you??!'),
              trailing: Text('5:00 AM'),
            ),
            Divider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
