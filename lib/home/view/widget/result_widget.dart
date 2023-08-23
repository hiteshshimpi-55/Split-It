import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final Map<String,dynamic> result;
  const ResultWidget({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        avatarWidget(result['payer']),
        const SizedBox(
          width: 10,
        ),
        Column(
          children: [
             Text(
              result["amount"].toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              size: 30,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        avatarWidget(result['receiver']),
      ],
    );
  }

  Widget avatarWidget(String name){
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[300],
          child: const Icon(
            Icons.person,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
