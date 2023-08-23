import 'package:flutter/material.dart';

import '../widgets/category_list_view.dart';
import '../widgets/news_list_view.dart';
import '../widgets/news_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   elevation: 0,
      //   title:
      //       const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      //     Text(
      //       'News',
      //       style: TextStyle(color: Colors.black),
      //     ),
      //     Text(
      //       'Cloud',
      //       style: TextStyle(color: Colors.orange),
      //     )
      //   ]),
      // ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              // SliverToBoxAdapter(
              //   child: CategoryListView(),
              // ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 28),
              ),
              NewsListView()
            ],
          )

          // Column(
          //   children: [
          //     CategoryListView(),
          //     const SizedBox(
          //       height: 28,
          //     ),
          //     Expanded(child: NewsListView()),
          //   ],
          // ),
          ),
    );
  }
}
