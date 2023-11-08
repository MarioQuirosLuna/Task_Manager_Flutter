import 'package:flutter/material.dart';

class TaskDateFilter extends StatelessWidget {
  const TaskDateFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Today', style: Theme.of(context).textTheme.titleMedium),
        TextButton(
          onPressed: () {},
          child: const Text('See all', style: TextStyle(color: Colors.blue)),
        )
      ],
    );
  }
}