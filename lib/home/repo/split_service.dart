import '../models/people_model.dart';

class SplitService {
  List<Map<String, dynamic>> getSplit(
      List<PeopleModel> people, double totalAmount) {
    double totalExpense = totalAmount;
    int numFriends = people.length;

    double share = totalExpense / numFriends;

    List<Friend> toReceive = [];
    List<Friend> toPay = [];

    // Calculate who owes and who is owed
    for (PeopleModel person in people) {
      double difference = person.amount! - share;

      if (difference > 0) {
        toReceive.add(Friend(name: person.name!, contribution: difference));
      } else if (difference < 0) {
        toPay.add(Friend(name: person.name!, contribution: -difference));
      }
    }

    // Sort both lists in descending order of amounts
    toReceive.sort(compareContributions);
    toPay.sort(compareContributions);

    List<Map<String, dynamic>> settlements = [];

    // Perform settlement
    int r = 0, p = 0;
    while (r < toReceive.length && p < toPay.length) {
      Friend receiver = toReceive[r];
      Friend payer = toPay[p];

      if (receiver.contribution == payer.contribution) {
        settlements.add({
          "receiver": receiver.name,
          "payer": payer.name,
          "amount": receiver.contribution,
        });
        r++;
        p++;
      } else if (receiver.contribution > payer.contribution) {
        settlements.add({
          "receiver": receiver.name,
          "payer": payer.name,
          "amount": payer.contribution,
        });
        receiver.contribution -= payer.contribution;
        p++;
      } else {
        settlements.add({
          "receiver": receiver.name,
          "payer": payer.name,
          "amount": receiver.contribution,
        });
        payer.contribution -= receiver.contribution;
        r++;
      }
    }

    return settlements;
  }
}

class Friend {
  String name;
  double contribution;

  Friend({required this.name, required this.contribution});
}

int compareContributions(Friend a, Friend b) {
  return b.contribution.compareTo(a.contribution);
}
