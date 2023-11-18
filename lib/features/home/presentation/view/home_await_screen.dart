import 'dart:isolate';
import 'package:flutter/material.dart';

class HomeAwaitScreen extends StatefulWidget {
  const HomeAwaitScreen({Key? key}) : super(key: key);

  @override
  State<HomeAwaitScreen> createState() => _HomeAwaitScreenState();
}

class _HomeAwaitScreenState extends State<HomeAwaitScreen> {
  int runHeavyTaskWithOutIsolate(int count) {
    int value = 0;
    for (var i = 0; i < count; i++) {
      value += i;
    }
    print(value);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Isolates')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 50),
            ElevatedButton(
              child: const Text('Run Heavy Task'),
              onPressed: () => runHeavyTaskWithOutIsolate(100000),
            ),
          ],
        ),
      ),
    );
  }
}

useIsolate() async {
  // final ReceivePort receivePort = ReceivePort();
  // try {
  //   await Isolate.spawn(
  //       runHeavyTaskIWithIsolate, [receivePort.sendPort, 4000000000]);
  // } on Object {
  //   debugPrint('Isolate Failed');
  //   receivePort.close();
  // }
  // final response = await receivePort.first;

  await Isolate.spawn(runHeavyTaskIWithIsolate , 4000);

}

runHeavyTaskIWithIsolate(int value) {
  for (var i = 0; i < value; i++) {
    value += i;
    print(value);
  }
}
