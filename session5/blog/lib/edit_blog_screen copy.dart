import 'package:blog/blog.dart';
import 'package:flutter/material.dart';

class EditBlogScreen extends StatefulWidget {
  EditBlogScreen({
    super.key,
    required this.Title,
    required this.Content,
    required this.ImageUrl,
  });

  final String Title;
  final String Content;
  final String ImageUrl;

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final TitleController = TextEditingController();

  final BodyController = TextEditingController();

  final ImageUrlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    TitleController.text = widget.Title;
    BodyController.text = widget.Content;
    ImageUrlController.text = widget.ImageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Blog'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: TitleController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  hintText: "Enter your Title"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: BodyController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Body",
                  hintText: "Enter your Body"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: ImageUrlController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "ImageUrl",
                  hintText: "Enter your image"),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.orange, minimumSize: const Size(120, 50)),
              onPressed: () {
                String Title = TitleController.text;
                String Body = BodyController.text;
                String imageUrl = ImageUrlController.text;
                Blog blog = Blog(title: Title, body: Body, imageUrl: imageUrl);
                Navigator.pop(context, blog);
              },
              child: const Text(
                'Update',
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
            ),
          )
        ],
      ),
    );
  }
}
