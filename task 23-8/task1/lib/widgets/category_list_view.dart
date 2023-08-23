import 'package:flutter/cupertino.dart';

import '../models/category_nodel.dart';
import 'category_card.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({super.key});
  final List<CategoryModel> categorys = [
    CategoryModel(
        image: 'https://th.bing.com/th/id/OIG.lVXjWwlHyIo4QdjnC1YE',
        categoryName: 'butiful'),
    CategoryModel(
        image:
            'https://imgv3.fotor.com/images/slider-image/A-clear-image-of-a-woman-wearing-red-sharpened-by-Fotors-image-sharpener.jpg',
        categoryName: 'machine'),
    CategoryModel(
        image:
            'https://bl-i.thgim.com/public/incoming/wiz4fe/article65865553.ece/alternates/FREE_1200/2022%20TVS%20Apache%20RTR%20160.jpg',
        categoryName: 'machine'),
    CategoryModel(
        image:
            'https://i.insider.com/60638bd66183e1001981966a?width=1136&format=jpeg',
        categoryName: 'Business'),
    CategoryModel(
        image:
            'https://funkylife.in/wp-content/uploads/2023/03/good-morning-image-531.jpg',
        categoryName: 'Cat'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categorys.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryModel: categorys[index],
          );
        });
  }
}
