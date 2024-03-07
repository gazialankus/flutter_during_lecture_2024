import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int add(int a, int b, {required bool printThem, bool printNicely = false}) {
  if (printThem) {
    if (printNicely) {
      print('the params are $a and $b');
    } else {
      print(a);
      print(b);
    }
  }

  return a + b;
}


void main() {
  int c = add(
    5,
    6,
    printThem: false,
  );

  print(c);


  print('running!');

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  int _counter = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: MyColoredWidget(counter: _counter),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            MyColoredWidget(counter: 10,
                f: (int a, int b) {
                  return a + b;
                }
            ),
            MyColoredWidget(counter: 11, f: (int a, int b) => a,),
            MyColoredWidget(counter: 12),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('pressed');
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

class MyColoredWidget extends StatelessWidget {
  const MyColoredWidget({
    required this.counter, int Function(int a, int b)? f,
  });

  final int counter;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.blue,
        child: Column(
          children: [
            Row(
              children: [
                Text('This is the widget'),
                Text('in the row')
              ],
            ),
            Text(
              '*** $counter --aoeauaoeoeuaoe',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
