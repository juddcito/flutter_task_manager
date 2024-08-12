import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateTimePicker extends StatelessWidget {

  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final String? label;

  const CustomDateTimePicker({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
    this.label
  });

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10, bottom: 15),
      child: InkWell(
        onTap: () => selectDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            filled: true,
            labelText: label,
            border: const OutlineInputBorder(),
            hintText: 'No due date'
          ),
          child: Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 10),
              Text(
                selectedDate != null ? DateFormat('d MMMM yyyy').format(selectedDate!) : 'No date selected',
                style: const TextStyle(fontSize: 16),
              ),              
            ],
          ),
        ),
      ),
    );
  }
}