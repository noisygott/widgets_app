import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';


class CounterRiverpood extends ConsumerWidget {
  static const String name = 'counter_screen';
  const CounterRiverpood({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCounter = ref.watch(counterProvider);

    final bool darkMode = ref.watch(darkProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),
        actions: [
          IconButton(
            icon: !darkMode ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined),
            
            onPressed: (){
              ref.read(darkProvider.notifier).update((state) => !state );
            }, 
          )
        ],

      ),

      body: Center(child: Text('Valor: $clickCounter',style: Theme.of(context).textTheme.titleLarge,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;

          // ref.read(counterProvider.notifier).update((state) => state + 1);
          
        }, 
        child: Icon(Icons.add)
      ),
    );
  }
}