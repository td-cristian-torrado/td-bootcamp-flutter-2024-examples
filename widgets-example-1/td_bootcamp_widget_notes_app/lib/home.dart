import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes', style: Theme.of(context).textTheme.displaySmall),
          actions: const [
            FloatingActionButton.small(onPressed: null, child: Icon(Icons.search)),
            Padding(
              padding: EdgeInsets.fromLTRB(21,0,25,0),
              child: FloatingActionButton.small(onPressed: null, child: Icon(Icons.info)),
            ),
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
              Text('Create your first note !', 
              style: Theme.of(context).textTheme.bodyMedium?.
              copyWith(fontWeight: FontWeight.w300),)
            ],
          ),
        ),
        floatingActionButton: Theme(
          data: Theme.of(context)
            .copyWith(floatingActionButtonTheme: Theme.of(context)
            .floatingActionButtonTheme
            .copyWith(backgroundColor: const Color(0xFF252525))), 
          child: const FloatingActionButton(
            onPressed: null, child: Icon(Icons.add)),
        ),
    );
  }
}
