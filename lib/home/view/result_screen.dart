import 'package:flutter/material.dart';
import 'package:split_it/home/view/widget/result_widget.dart';

class ResultScreen extends StatelessWidget {
  final List<Map<String,dynamic>> result;
  const ResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding : const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context,index){
            return ResultWidget(result: result[index]);
          },
        ),
      ),
    );
  }
}
