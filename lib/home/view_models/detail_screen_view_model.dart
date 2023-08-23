import 'package:flutter/material.dart';
import 'package:split_it/home/models/people_model.dart';

class DetailViewModel extends ChangeNotifier{

   int peopleCount = 0;
   List<PeopleModel> _people = [];

   // getters
   List<PeopleModel> get getPeople => _people;

   DetailViewModel({required this.peopleCount});
   void addPerson({required String name, required double amount}){
     _people.add(PeopleModel(name: name, amount: amount));
     notifyListeners();
   }

}