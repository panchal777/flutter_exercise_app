import 'package:flutter/material.dart';

class NoRecordsFound extends StatelessWidget {
  const NoRecordsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("No Records Found"),
      ),
    );
  }
}
