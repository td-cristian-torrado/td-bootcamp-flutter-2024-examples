import 'package:flutter/material.dart';
import 'package:td_bootcamp_widget_notes_app/info_screen.dart';
import 'package:td_bootcamp_widget_notes_app/model/sticky_note.dart';
import 'package:td_bootcamp_widget_notes_app/themes/util.dart';
import 'package:td_bootcamp_widget_notes_app/utils/random_generators.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<StickyNote> _notesList = [];

  @override
  void initState() {
    super.initState();
    _notesList = [];
  }

  void _onFabTap(){
    setState(() {
       var newText = generateRandomString();
       var newColor = generateRandomColors();
       _notesList.add(StickyNote(text: newText, color: newColor));
    });
  }

  Future<void> _onFabTapBucle() async {
    for(int i=0; i<20; i++){
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          var newText = generateRandomString();
          var newColor = generateRandomColors();
          _notesList.add(StickyNote(text: newText, color: newColor));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notes', style: Theme.of(context).textTheme.displaySmall),
          actions: [
            Theme(
              data: getFabCustomTheme(context: context),
              child: const FloatingActionButton.small(onPressed: null, child: Icon(Icons.search))),
             Padding(
              padding: const EdgeInsets.fromLTRB(21,0,25,0),
              child: Theme(
                data: getFabCustomTheme(context: context),
                child:  FloatingActionButton.small(onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InfoScreen(),
                      ),
                  );
                }, child: const Icon(Icons.info))),
            ),
          ],
        ),
        body: _notesList.isEmpty ? _emptyViewFactory() : _noteListFactory(),
        floatingActionButton: Theme(
          data: getFabCustomTheme(context: context), 
          child: FloatingActionButton(
            onPressed: _onFabTapBucle, child: const Icon(Icons.add)),
        ),
    );
  }

  Widget _cardFactory({required StickyNote stickyNote}) {
     return Padding(
             padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
             child: Card( color: stickyNote.color, child:  Padding(
               padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 45), 
                child: Text(stickyNote.text, 
                style: Theme.of(context).textTheme.headlineSmall!
                .copyWith(color:Colors.black ))),
             ),
           );
  }

  Widget _emptyViewFactory(){
    return  SizedBox(
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
        ); 
  }

  Widget _noteListFactory(){
    return ListView(children: _notesList.reversed.map((stickyNote) => _cardFactory(stickyNote: stickyNote)).toList(),);
  }
}

