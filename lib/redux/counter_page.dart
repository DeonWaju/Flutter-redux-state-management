import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_tutorial/redux/actions/counter_actions.dart';
import 'package:flutter_redux_tutorial/redux/stores/counter_state.dart';

class CounterPage extends StatefulWidget {
  CounterPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<CounterState, int>(
                converter: (store) => store.state.count,
                builder: (context, count) {
                  return Text(
                    '$count',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
                
                
          ],
          
        ),
      ),
      floatingActionButton: StoreConnector<CounterState, VoidCallback>(
        converter: (store) {  
          return () => store.dispatch(DecreaseAction(2));
        },
        builder: (context, increase) {

          return FloatingActionButton(
            onPressed: increase,
            tooltip: 'Increment',
            child: Icon(Icons.remove_circle,
          )
          );}
      ),
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
