import 'package:flutter/material.dart';
import 'package:newsapp/screens/login.dart';

import 'package:newsapp/widgets/category_list_view.dart';
import 'package:newsapp/widgets/news_list_view.dart';

class TapController extends StatelessWidget {
  const TapController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text('Basem Mostafa Morsy'),
                  accountEmail: Text('basemMostafa@gmail.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/image/366259944_1890125308036458_9135510755082691144_n.jpg'),
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    title: Text('Basem Mostafa'),
                    trailing: Icon(Icons.person_2_outlined),
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    title: Text('Helper'),
                    trailing: Icon(Icons.help),
                  ),
                ),
                Card(
                  color: Colors.grey[200],
                  child: ListTile(
                    title: Text('Logout'),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        icon: Icon(Icons.logout)),
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.orange,
            bottom: TabBar(indicatorColor: Colors.white, tabs: [
              Tab(
                icon: Icon(Icons.newspaper),
                text: 'International news',
              ),
              Tab(
                icon: Icon(Icons.store_mall_directory),
                text: 'Local news',
              )
            ]),
          ),
          body: TabBarView(children: [NewsListView(), CategoryListView()]),
        ));
  }
}
