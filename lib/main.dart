import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_bloc/color_bloc.dart';
import 'color_bloc/color_state.dart';
import 'counter_bloc/counter_bloc.dart';
import 'counter_bloc/counter_event.dart';
import 'counter_bloc/counter_state.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<CounterBloc>(
    create: (context) => CounterBloc(),
    ),
      BlocProvider<ColorBloc>(
        create: (context) => ColorBloc(),
      ),
    ], child: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Block Provider"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, counterState) {
              return BlocBuilder<ColorBloc, ColorState>(
                builder: (context, colorState) {
                  return Text(
                    counterState.counter.toString(),
                    style: TextStyle(
                      color: colorState.colors,
                      fontSize: 50,
                      fontWeight: FontWeight.w600
                    ),
                  );
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterIncrementEvent());
                  context.read<ColorBloc>().add(CounterIncrementEvent());
                },
                child: Icon(Icons.add,size: 50)
              ),
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterBloc>().add(CounterDecrementEvent());
                  context.read<ColorBloc>().add(CounterDecrementEvent());
                },
                child: Icon(Icons.remove,size: 50,)
                ),
            ],
          ),
        ],
      ),
    );
  }
}
