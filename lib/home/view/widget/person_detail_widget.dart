import 'package:flutter/material.dart';
import 'package:split_it/home/models/people_model.dart';
import 'package:split_it/home/view_models/detail_screen_view_model.dart';

class PersonDetailWidget extends StatefulWidget {
  final DetailViewModel detailViewModel;
  const PersonDetailWidget({super.key, required this.detailViewModel});

  @override
  State<PersonDetailWidget> createState() => _PersonDetailWidgetState();
}

class _PersonDetailWidgetState extends State<PersonDetailWidget> {
  // PeopleModel? peopleModel;
  bool isEditable = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: TextField(
          autocorrect: true,
          readOnly: !isEditable,
          controller: nameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(hintText: 'Name'),
        ),
        subtitle: TextField(
          autocorrect: true,
          readOnly: !isEditable,
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Amount'),
        ),
        trailing: isEditable
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isEditable = false;
                  });
                  widget.detailViewModel.addPerson(
                      name: nameController.text,
                      amount: double.parse(amountController.text));
                },
                icon: const Icon(Icons.check),
              )
            : IconButton(
                onPressed: () {
                  setState(() {
                    isEditable = true;
                  });
                },
                icon: const Icon(Icons.edit),
              ),

      ),
      // )(children: <Widget>[
      //   const Icon(Icons.people),
      //   const SizedBox(width: 10),
      //   TextField(
      //     autocorrect: true,
      //     controller: nameController,
      //     keyboardType: TextInputType.name,
      //     decoration: const InputDecoration(hintText: 'Name'),
      //   ),
      //   const SizedBox(width: 10),
      //   TextField(
      //     autocorrect: true,
      //     controller: amountController,
      //     keyboardType: TextInputType.number,
      //     decoration: const InputDecoration(hintText: 'Amount'),
      //   ),
      //   const SizedBox(width: 10),
      //   isEditable? IconButton(
      //     onPressed: () {
      //       setState(() {
      //         isEditable = false;
      //       });
      //       widget.detailViewModel.addPerson(
      //           name: nameController.text,
      //           amount: double.parse(amountController.text));
      //     },
      //     icon: const Icon(Icons.check),
      //   ): IconButton(
      //     onPressed: () {
      //       setState(() {
      //         isEditable = true;
      //       });
      //     },
      //     icon: const Icon(Icons.edit),
      //   ),
      // ]),
    );
  }
}
