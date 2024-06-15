import 'package:flutter/material.dart';
import 'package:td_bootcamp_widget_notes_app/themes/util.dart';

class InfoScreen extends StatelessWidget{
  
  const InfoScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leadingWidth: 77,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(25.0,8.0,8.0,4.0),
            child: Theme(
                data: getFabCustomTheme(context: context),
                child: FloatingActionButton.small(onPressed: (){
                  Navigator.of(context).pop();
                }, 
                child: const Icon(Icons.chevron_left_outlined))),
          ),
          actions: [
            Theme(
              data: getFabCustomTheme(context: context),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(0,0,25,0),
                child: FloatingActionButton.small(onPressed: null, child: Icon(Icons.edit)),
              )),
          ],
        ), 
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 27.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),
                Text("Book Review : The Design of Everyday Things by Don Norman", style: Theme.of(context).textTheme.displaySmall), 
                const SizedBox(height: 38),
                RichText(text:
                  TextSpan(style: Theme.of(context).textTheme.headlineSmall, 
                  children:  [
                    const TextSpan(text: "The Design of Everyday Things is required reading for anyone who is interested in the user experience. I personally like to reread it every year or two."),
                    const TextSpan(text: "\n\n"),
                    const TextSpan(text: "Norman is aware of the durability of his work and the applicability of his principles to multiple disciplines."),
                    const TextSpan(text: "\n\n"),
                    TextSpan(text: "If you know the basics of design better than anyone else, you can apply them flawlessly anywhere.", 
                      style: Theme.of(context).textTheme.headlineSmall!
                      .copyWith(fontStyle: FontStyle.italic))
                  ]))
              ]),
          ),
        ),
      )
      ) ;
  }


}