import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.search)),
            IconButton(onPressed: null, icon: Icon(Icons.info)),
          ],
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/rafiki.png'),
              const Text('Create your first note !')
            ],
          ),
        ),
        floatingActionButton: const FloatingActionButton(
          onPressed: null, child: Icon(Icons.add)),
    );
  }
}
