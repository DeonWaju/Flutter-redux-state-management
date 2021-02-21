import 'package:flutter_redux_tutorial/redux/stores/counter_state.dart';

class IncreaseAction {
  int amount;
  IncreaseAction(this.amount);

  CounterState increament(CounterState previousState) {
    previousState.count++;
    return previousState;
  }
}

class DecreaseAction {
  int amount;

  DecreaseAction(this.amount);

  CounterState decreament(CounterState previousState, int amount) {
    previousState.count -= amount;
    return previousState;
  }
}
