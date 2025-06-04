import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener( (){
      final page = pageviewController.page ?? 0;
      if(!endReached && page >= slide.length - 1.5){
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(), 
            children: slide.map((e) => _Slide(
              title: e.title, 
              caption: e.caption, 
              imageUrl: e.imageUrl)
            ).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop() , 
              child: Text("Salir")
            )
          ),

          endReached ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(seconds: 1),
              child: FilledButton(
                onPressed: () => context.pop(), 
                child: const Text("Comenzar")
              ),
            )
          ):SizedBox()
        ],
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

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image( image: AssetImage( imageUrl ) ),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            SizedBox(height: 10),
            Text(caption, style: captionStyle,)
          ]
          
        ),
      ),
    );
  }
}
