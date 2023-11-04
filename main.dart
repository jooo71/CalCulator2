import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/cal_provider.dart';
import 'package:provider/provider.dart';
import 'buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorProvider(),
      child: MaterialApp(
          theme: ThemeData
              .dark(), // 34an elkema tban 34an background black flklma b2t beda
          debugShowCheckedModeBanner: false, // el4ret elly fo2 elly mktop 3leeh debug b4elo
          home: HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  final List labelsList=["C","/","X","%","Del","7","8","9","+","-","4","5","6","(",")","1","2","3","^","sqrt","e","0",".","sin","="];
  final padding = const EdgeInsets.symmetric(horizontal: 25, vertical: 30);
  final decoration = const BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)));
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(builder: (context, provider, _) {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.calculate),
              Text("CalculatorApp"),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: TextField(
                controller: provider.CompController,
                decoration:  InputDecoration(
                  border:OutlineInputBorder(borderRadius:BorderRadius.circular(25)), // 34an a5fy line ally t7t text box // a3ml curvature input box
                  fillColor: Colors.white12, // color text file
                  filled: true, // 34an color yzhr

                ),
                style: const TextStyle(fontSize: 50),
                readOnly: true,
                autofocus: true,
                showCursor: true,

              ),
            ),
            Container(
              padding: padding,
              decoration: decoration,
              child: GridView.builder(
                itemCount: labelsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(        //2D array of list of items
                    crossAxisCount: 5,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10),
                shrinkWrap: true,     // كل ما اضيف زرار بقيت الزراير تصغر واعرف احط زراير زى ما انا عايز
                itemBuilder: (context, index) =>Button(label: labelsList[index]),
              ), // 34an nbd2 n4ml buttons
            )
          ],
        ),
      );
    });
  }
}
