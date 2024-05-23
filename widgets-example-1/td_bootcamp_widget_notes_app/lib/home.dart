import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> _notesList = [];

  @override
  void initState() {
    super.initState();
    _notesList = [];
  }

  void _onFabTap(){
    setState(() {
       var newNote = generateRandomString();
       _notesList.add(newNote);
        print(newNote);
        print(_notesList.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes', style: Theme.of(context).textTheme.displaySmall),
          actions: [
            Theme(
              data: _getFabCustomTheme(context: context),
              child: const FloatingActionButton.small(onPressed: null, child: Icon(Icons.search))),
             Padding(
              padding: const EdgeInsets.fromLTRB(21,0,25,0),
              child: Theme(
                data: _getFabCustomTheme(context: context),
                child: const FloatingActionButton.small(onPressed: null, child: Icon(Icons.info))),
            ),
          ],
        ),
        body: ListView(children: _notesList.map((text) => _cardFactory(text: text)).toList(),) ,
        floatingActionButton: Theme(
          data: _getFabCustomTheme(context: context), 
          child: FloatingActionButton(
            onPressed: _onFabTap, child: Icon(Icons.add)),
        ),
    );
  }

  ThemeData _getFabCustomTheme({required BuildContext context}){
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    return Theme.of(context)
            .copyWith(colorScheme: Theme.of(context)
              .colorScheme.copyWith(
                primaryContainer: brightness == Brightness.light ? const Color(0xFFFFFFFF) : const Color(0xFF252525),
                onPrimaryContainer: brightness == Brightness.dark ? const Color(0xFFFFFFFF) : const Color(0xFF252525)));
  }

  Widget _cardFactory({required String text}) {
     return Padding(
             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
             child: Card( color: Colors.green, child:  Padding(
               padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 45), 
                child: Text(text, 
                style: Theme.of(context).textTheme.headlineSmall!
                .copyWith(color:Colors.black ))),
             ),
           );
  }

  /*
   
  SizedBox(
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
   
   
  */
}

String generateRandomString() {
    const String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final Random random = Random();
    return List.generate(Random()
      .nextInt(50), 
      (index) => chars[random.nextInt(chars.length)])
      .join();
}