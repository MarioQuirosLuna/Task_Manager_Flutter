import 'package:flutter/material.dart';

class DateFieldInput extends StatelessWidget {
  const DateFieldInput({
    super.key,
    required this.dateController,
  });

  final TextEditingController dateController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dateController,
      decoration: InputDecoration(
        labelText: 'Due Date',
        suffixIcon: IconButton(
          onPressed: () async {
            final selectedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );
            if (selectedDate != null && selectedDate != dateController.text) {
              dateController.text = selectedDate.toLocal().toString().split(' ')[0];
            }
          },
          icon: const Icon(Icons.calendar_today),
        ),
      ),
      readOnly: true,
    );
  }
}
