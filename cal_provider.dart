import 'package:flutter/cupertino.dart';
import 'package:function_tree/function_tree.dart';

class CalculatorProvider extends ChangeNotifier{
  final CompController = TextEditingController(); // 34an nt6km fy textfield

  setValue(String value)
  {
    String str = CompController.text;
    switch(value)
    {
      case "C":
        CompController.clear();
        break;
      case"Del":
        CompController.text= str.substring(0,str.length-1);
        break;
      case "X":
        CompController.text+="*";
        break;
      case "=":
        compute();
        break;
      default:
        CompController.text+= value;
    }
    notifyListeners();
  }

  compute()
  {
    String text =CompController.text;
    CompController.text=text.interpret().toString();
    notifyListeners();
  }

  @override
  void dispose() { // lma 2ffl chrom mefdl4 4a8l fy background
    super.dispose();
    CompController.dispose();
  }
}