import 'dart:async';

import 'package:flutter/material.dart';
import 'package:restart_app/restart_app.dart';

void main() {
  debugPrint('Flutter!!!');
  runApp(const MyApplication());
}

class MyApplication extends StatefulWidget {
  const MyApplication({super.key});

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  int uptime = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      debugPrint('Tick: ${timer.tick}');
      setState(() => uptime = timer.tick);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('package:restart_app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Uptime: ${uptime}s'),
              const SizedBox(height: 16.0),
              const OutlinedButton(
                onPressed: RestartApp.restart,
                child: Text('Restart'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
