
import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/cal_provider.dart';
import 'package:provider/provider.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.label,});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorProvider>(
      
      builder: (context, CalcProvider, _) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
            // disabledBackgroundColor: Colors.blueGrey,
            shape: const CircleBorder(),
            padding: EdgeInsets.all(10), //to big button del , sqrt , sin

          ),
          onPressed:() =>CalcProvider.setValue(label),
          child: FittedBox(
            child: Text(
              label,
              style: TextStyle(
                  color:label=="7" || label=="8"|| label=="9"|| label=="4"|| label=="5"|| label=="6"|| label=="4"|| label=="3"|| label=="2"|| label=="1"|| label=="0"?Colors.black: Colors.red, fontSize: label!="Del"? 30:30, fontWeight: FontWeight.bold,),
            ),
          ),
        );
      }
    );
  }
}
