import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_it/home/models/people_model.dart';
import 'package:split_it/home/repo/split_service.dart';
import 'package:split_it/home/view/result_screen.dart';
import 'package:split_it/home/view/widget/person_detail_widget.dart';
import 'package:split_it/home/view_models/detail_screen_view_model.dart';

class DetailScreen extends StatelessWidget {
  final int peopleCount;
  final double totalAmount;
  const DetailScreen({super.key, required this.peopleCount, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        ChangeNotifierProvider(
          create: (context) => DetailViewModel(peopleCount: peopleCount),
          child: Consumer<DetailViewModel>(
              builder: (context, detailViewModel, child) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: detailViewModel.peopleCount,
                    itemBuilder: ((context, index) {
                      return PersonDetailWidget(detailViewModel: detailViewModel);
                    }),
                  ),
                ),
                TextButton(onPressed: () {
                  print("Split Bill : ${detailViewModel.getPeople}");
                  final result = SplitService().getSplit(detailViewModel.getPeople, totalAmount);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(result: result)));
                  print(" The result : $result");
                }, child: const Text("Split Bill")),
              ],
            );
          }),
        ),
    );
  }
}
