import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldi_66_bloc_provider/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CounterBloc(0),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) => Text(
              (state == bloc.counter)
                  ? 'Angka saat ini : $state'
                  : 'Angka saat ini : ${bloc.counter}',
              style: TextStyle(fontSize: 25),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  bloc.add('minus');
                },
                icon: Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  bloc.add('add');
                },
                icon: Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
