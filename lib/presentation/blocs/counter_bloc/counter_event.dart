part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreased extends CounterEvent{
  final int value;
  const CounterIncreased(this.value);
}
