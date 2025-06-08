


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_screen';
  const ThemeChangerScreen({super.key});


  @override
  Widget build(BuildContext context, ref) {

    final darkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cambiar tema'),
        actions: [
          IconButton(
            icon: !darkMode ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined),
            
            onPressed: (){
              ref.read(themeNotifierProvider.notifier).toggleDarkmode();
            },
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);

    final int selectColor = ref.watch(themeNotifierProvider).selectColor;



    const List<String> colorName = colorsName;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text(colorName[index], style: TextStyle(color: color),),
          subtitle: Padding(
            padding: EdgeInsets.only(right: 100),
            child: Container(
              height: 30,
              color: color,
            ),
          
          ),
          value: index, 
          groupValue: selectColor, 
          onChanged: (value) {
          //Todo: notificar el cambio
            //ref.read(selectedColorProvider.notifier).state = index;
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index);


          }
        );
      },
    );
  }
}