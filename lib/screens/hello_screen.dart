import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: Center(
                      child: Text(
                'Hello new user!',
                style: TextStyle(fontSize: 34),
              ))),
              ElevatedButton(onPressed: () {}, child: Text('Got it'))
            ],
          ),
        ),
      ),
    );
  }
}
