import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlockCounterScreen extends StatelessWidget {
  const BlockCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(), child: const BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
   context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (CounterBloc bloc) => Text('Counter Value ${bloc.state.counter}'),
        ) ,
        actions: [
          IconButton(onPressed: () => context.read<CounterBloc>().resetCounter,
           icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: context.select(
          (CounterBloc counterBloc) =>
              Text('Counter Value ${counterBloc.state.counter}'),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: ()=>  increaseCounterBy(context , 3),
            heroTag: '1',
            child: const Text("+3"),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context , 2),
            heroTag: '2',
            child: const Text("+2"),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context , 1),
            heroTag: '3',
            child: const Text("+1"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
