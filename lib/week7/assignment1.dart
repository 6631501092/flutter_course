import 'package:flutter/material.dart';

class Assignment1W7 extends StatefulWidget {
  const Assignment1W7({super.key});

  @override
  State<Assignment1W7> createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<Assignment1W7> {
  //today is October 30, 2025
  DateTime today = DateTime(2025, 10, 30);
  late DateTime _startDate;
  late DateTime _endDate;

  @override
  void initState() {
    super.initState();
    _startDate = today;
    _endDate = today;
  }

  Future<void> _selectStartDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _startDate,
      firstDate: DateTime(2025, 1, 1),
      lastDate: DateTime(2025, 12, 31),
    );

    if (picked != null) {
      setState(() {
        _startDate = picked;
        if (_startDate.isAfter(_endDate)) {
          _endDate = _startDate;
        }
      });
    }
  }

  Future<void> _selectEndDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _endDate,
      firstDate: _startDate,
      lastDate: DateTime(2025, 12, 31),
    );

    if (picked != null) {
      setState(() {
        _endDate = picked;
      });
    }
  }

  String formatDate(DateTime dt) {
    return '${dt.day}/${dt.month}/${dt.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('DatePicker Demo')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                FilledButton.icon(
                  onPressed: _selectStartDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('From'),
                ),
                const SizedBox(width: 8),
                Text(formatDate(_startDate)),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                FilledButton.icon(
                  onPressed: _selectEndDate,
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('To'),
                ),
                const SizedBox(width: 8),
                Text(formatDate(_endDate)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
