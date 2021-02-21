
import 'package:flutter_redux_tutorial/redux/actions/counter_actions.dart';
import 'package:flutter_redux_tutorial/redux/stores/counter_state.dart';

CounterState counterStateReducer(CounterState previousState, dynamic action) {

    if(action is IncreaseAction) {
      return action.increament(previousState);
    } else

    if(action is DecreaseAction) {
      return action.decreament(previousState, action.amount);
    }

  return previousState;

}

