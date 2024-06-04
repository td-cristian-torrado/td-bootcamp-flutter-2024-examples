import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:td_bootcamp_widget_notes_app/themes/util.dart';

class InfoScreen extends StatelessWidget{
  
  const InfoScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Theme(
              data: getFabCustomTheme(context: context),
              child: FloatingActionButton.small(onPressed: (){
                Navigator.of(context).pop();
              }, 
              child: const Icon(Icons.chevron_left_outlined))),
          actions: [
            Theme(
              data: getFabCustomTheme(context: context),
              child: const FloatingActionButton.small(onPressed: null, child: Icon(Icons.edit))),
          ],
        ), 
      body: const Column(children: [
          Text("Book Review : The Design of Everyday Things by Don Norman"), 
          Text('''The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two.

Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines. 

If you know the basics of design better than anyone else, you can apply them flawlessly anywhere.''')
        ])
      ) ;
  }


}