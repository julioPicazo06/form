import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<CounterIncreased>(_onCounterIncreased);
    // se crea un nuevo manejador para el evento CounterReset
    on<CounterReset>(_onCounterReset);
  }
  // se crea un manejador para el evento CounterIncreased
  void _onCounterIncreased(CounterIncreased event, Emitter<CounterState> emit) {
    emit(state.copyWith(
      counter: state.counter + event.value,
      transactionCount: state.transactionCount + 1,
    ));
  }

  //  se crea un evento para resetear el contador

  void _onCounterReset(CounterReset event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: 0));
  }
  // centralisar el codigo de incremento
  void increaseBy([int value = 1]){
    add( CounterIncreased(value) );
  }
  // centralisar el codigo de reset
  void resetCounter(){
    add( CounterReset() );
  }

}
