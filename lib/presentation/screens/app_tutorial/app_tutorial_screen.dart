import 'package:flutter/material.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slide = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Nulla ut anim anim duis magna.',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rapida',
    'Adipisicing labore elit aute irure duis enim pariatur sit voluptate eu.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta la comida',
    ' et dolore pariatur nostrud id eu id aliquip dolore ullamco minim.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(), 
        children: slide.map((e) => _Slide(
          title: e.title, 
          caption: e.caption, 
          imageUrl: e.imageUrl)
        ).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title, 
    required this.caption, 
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
