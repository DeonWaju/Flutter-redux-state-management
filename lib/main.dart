import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_tutorial/redux/counter_page.dart';
import 'package:flutter_redux_tutorial/redux/reducers/counter_reducer.dart';
import 'package:flutter_redux_tutorial/redux/stores/counter_state.dart';
import 'package:redux/redux.dart';

void main() {
  final Store<CounterState> store = Store<CounterState>(
    counterStateReducer,
    initialState: CounterState(),
  );

  runApp(
    MyApp(
      store: store,
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({
    Key key,
    @required this.store,
  }) : super(key: key);
  final Store store;
  @override
  Widget build(BuildContext context) {
    return StoreProvider<CounterState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: CounterPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
