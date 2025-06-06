import 'package:flutter/material.dart';


class CounterRiverpood extends StatelessWidget {
  static const String name = 'counter_screen';
  const CounterRiverpood({super.key});

  @override
  Widget build(BuildContext context) {

    int acount = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Screen'),

      ),

      body: Center(child: Text('Valor: $acount',style: Theme.of(context).textTheme.titleLarge,)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          acount++;
          
        }, 
        child: Icon(Icons.add)
      ),
    );
  }
}