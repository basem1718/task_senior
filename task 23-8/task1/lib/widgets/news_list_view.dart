import 'package:flutter/material.dart';
import 'package:newsapp/widgets/show_details.dart';

import '../models/artical_model.dart';
import 'news_tile.dart';

class NewsListView extends StatelessWidget {
  NewsListView({super.key});
  final List<ArticalModel> articals = [
    ArticalModel(
      image:
          'https://www.imagescanada.ca/wp-content/uploads/2019/03/Spectacular-Photos-of-Niagara-Falls-Casinos.jpg',
      title: 'Photos spectaculaires des casinos de Niagara Falls',
      subTitle:
          'Des casinos aux résumés époustouflants vont bien au-delà des jeux de cartes, des machines à sous, des roulettes (pour n’en citer que quelques-uns), bien au-delà de la possibilité de gagner des jackpots et de perdre des sommes énormes de votre argent durement gagné. en un éclair. Oui, ils conservent leur symbole d’argent – le jeton de casino – qui est également loin de leur véritable attrait.',
    ),
    ArticalModel(
      image:
          'https://cdn.jpegmini.com/user/images/slider_puffin_before_mobile.jpg',
      title: 'Reduce image file size without compromising quality',
      subTitle:
          'Get the smallest image file size without compromising quality or changing your workflow. You can upload Hi-Res photos faster, save tons of hard drive space, improve customer viewing experience and make your website faster.',
    ),
    ArticalModel(
      image:
          'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDE1fHx8ZW58MHx8fHx8&w=1000&q=80',
      title:
          'This article is about visual artifacts or reproductions. For other uses, see',
      subTitle:
          'An image is a visual representation of something. An image can be a two-dimensional (2D) representation, such as a drawing, painting, or photograph, or a three-dimensional (3D) object, such as a carving or sculpture. An image may be displayed through other media, including projection on a surface, activation of electronic signals, or digital displays. Two-dimensional images can be still or animated. Still images can usually be reproduced through mechanical means, such as photography, printmaking or photocopying. In some cases, three-dimensional images may also be animated (capable of passive or active motion).',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: articals.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (value) {
                    return ShowDetails(articals[index]);
                  }));
                },
                child: NewsTile(articalModel: articals[index]));
          }),
    );

    // SliverList(
    //     delegate: SliverChildBuilderDelegate(childCount: articals.length,
    //         (context, index) {
    //   return InkWell(
    //       onTap: () {
    //         Navigator.of(context).push(MaterialPageRoute(builder: (value) {
    //           return ShowDetails(articals[index]);
    //         }));
    //       },
    //       child: NewsTile(articalModel: articals[index]));
    // }));
  }
}
