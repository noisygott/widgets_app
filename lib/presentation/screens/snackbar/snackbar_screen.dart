import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, //onpressed fuera de la caja no lo cierra
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('seguroo?'),
        actions: [
          TextButton(onPressed: () => context.pop() , child: const Text('Cancelar')),
          FilledButton(onPressed: ()=> context.pop() , child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y dialogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [const Text('Aqui tienes nuestras lisencias')],
                );
              },
              child: const Text("Licencias Usadas"),
            ),

            SizedBox(height: 10),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text("mostrar dialogo"),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Mostrosr Snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
