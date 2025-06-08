


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutable   Provider es para valores inmutables
final colorListProvider = Provider((ref) => colorList,);




// El StateProvider es para mantener una pieza de estado
final darkProvider = StateProvider<bool>((ref) => false);




// povider de in entero
final selectedColorProvider = StateProvider((ref) => 1);



// Es para mantener un objeto mas elavorado

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier()
);


// CONTROLER
class ThemeNotifier extends StateNotifier<AppTheme>{

  // STATE = estdo = new AppTheme();
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    
    state = state.copyWith(selectColor: colorIndex);
  }

}