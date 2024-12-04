import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _cubitCounterView());
  }
}

class _cubitCounterView extends StatelessWidget {
  const _cubitCounterView();

  void increseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Counter Value ${value.state.counter}');
        }),
        actions: [
          IconButton(
              onPressed: () => {context.read<CounterCubit>().reset()},
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
          child: BlocBuilder<CounterCubit, CounterState>(
        buildWhen: (previous, current) => previous.counter != current.counter,
        builder: (context, state) {
          return Text('Counter Value ${state.counter}');
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increseCounterBy(context, 3),
            heroTag: '3',
            child: const Text("+3"),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => increseCounterBy(context, 2),
            heroTag: '2',
            child: const Text("+2"),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => increseCounterBy(context),
            heroTag: '1',
            child: const Text("+1"),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
