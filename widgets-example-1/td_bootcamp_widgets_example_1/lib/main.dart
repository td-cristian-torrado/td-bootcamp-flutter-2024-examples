import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Container(
          width: 500,
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  Container(
                    height: 100,
                    color: Colors.green,
                    child: Row(
                      children: const [
                        Text("Text Widget"),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: null, child: Text("ElevatedButton")),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: null, child: Icon(Icons.laptop_mac)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(onPressed: () {
                            print("On ElevatedButton Pressed");
                          }, child: Icon(Icons.laptop_mac)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center ,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        FilledButton(onPressed: (){
                          print("On FilledButton Pressed");
                        }, child: Image.asset("assets/images/google_logo.png")),
                      ],
                    ),
                  )
                ],),
        )
      ),
    );
  }
}
