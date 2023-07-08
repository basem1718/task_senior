import 'package:blog/add_new_blog_screen.dart';
import 'package:blog/blog.dart';
import 'package:blog/edit_blog_screen%20copy.dart';
import 'package:blog/story_view.dart';
import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final imageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCtW2p14G0n6nVKp1hK8znOV8zP82uDxLAMgqhjr20s2k-_E6WFVYnkFSlszER9uITLCo&usqp=CAU";

  final imageurl2 =
      "https://burst.shopify.com/photos/person-holds-a-book-over-a-stack-and-turns-the-page/download";

  final name = "Basem Mostafa";

  List<Blog> blogs = [
    Blog(
        title: "Book",
        body:
            'Person holds a book open above a pile of open books and turns the pages with their hand.',
        imageUrl:
            "https://burst.shopify.com/photos/person-holds-a-book-over-a-stack-and-turns-the-page/download"),
    Blog(
        title: "Hands Reach To Feed A Flying",
        body:
            "Hand reach up to feed a seagull that is in mid flight with its wings out.",
        imageUrl:
            "https://burst.shopifycdn.com/photos/hands-reach-to-feed-a-flying-seagull.jpg?width=925&format=pjpg&exif=1&iptc=1"),
    Blog(
        title: "Flatlay Of A Coffee Mug ",
        body:
            "Flatlay of a mug of coffee, photos, a small world map, paper with writing that says See The World, all next to a cellphone and laptop.",
        imageUrl:
            "https://burst.shopifycdn.com/photos/flatlay-of-a-coffee-mug-and-items-to-plan-travel.jpg?width=925&format=pjpg&exif=1&iptc=1")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToaddBlogScreen(),
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => userItem(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) => blogeItem(index),
            ),
          )
        ],
      ),
    );
  }

  Widget userItem() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => StoryViewScreen()));
      },
      child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                  CircleAvatar(
                    radius: 11,
                    backgroundColor: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 9,
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
              Text(
                name.length > 8 ? "${name.substring(0, 10)}..." : name,
              ),
            ],
          )),
    );
  }

  Widget blogeItem(int index) {
    Blog blog = blogs[index];
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[300],
      ),
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Image.network(
              blog.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      navigatToEditeBlogScreen(index);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.green,
                    )),
                IconButton(
                    onPressed: () {
                      blogs.removeAt(index);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              blog.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  navigateToaddBlogScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNewBlogScreen(),
      ),
    ).then((value) {
      Blog blog = value;
      blogs.add(blog);
      setState(() {});
    });
  }

  void navigatToEditeBlogScreen(int index) {
    final Blog blog = blogs[index];
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditBlogScreen(
            Title: blog.title,
            Content: blog.body,
            ImageUrl: blog.imageUrl,
          ),
        )).then((value) {
      if (value == null) return;
      final Blog blog = value;
      blogs[index] = blog;
      setState(() {});
    });
  }
}
