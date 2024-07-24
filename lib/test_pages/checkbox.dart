import 'package:flutter/material.dart';

class CheckBoxList extends StatefulWidget {
  final List<String> choices;
  final List<String> selectedChoices;

  CheckBoxList({required this.choices, required this.selectedChoices});

  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  List<String> _selectedChoices = [];

  @override
  void initState() {
    super.initState();
    _selectedChoices = widget.selectedChoices;
  }

  void _onItemChecked(bool checked, String choice) {
    setState(() {
      if (checked) {
        _selectedChoices.add(choice);
      } else {
        _selectedChoices.remove(choice);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.choices.map((choice) {
        return CheckboxListTile(
          title: Text(choice),
          value: _selectedChoices.contains(choice),
          onChanged: (checked) => _onItemChecked(checked!, choice),
        );
      }).toList(),
    );
  }
}
