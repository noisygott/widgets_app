


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final darkProvider = StateProvider<bool>((ref) => false);

//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList,);


// povider de in entero
final selectedColorProvider = StateProvider((ref) => 1);
