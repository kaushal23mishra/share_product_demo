import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var fieldValue;
  String? hintText;
  // ignore: prefer_typing_uninitialized_variables
  var options;
  CustomDropdown({Key? key, this.fieldValue, this.hintText, this.options})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _chosenValue;
  // ignore: prefer_typing_uninitialized_variables
  var fieldValue;
  String? hintText;
  List<DropdownMenuItem<String>> dropDownItems = [];

  @override
  void initState() {
    super.initState();
    for (String item in widget.options) {
      dropDownItems.add(DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            item,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldValue,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 202, 201, 201),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
              color: Color.fromARGB(255, 202, 201, 201), width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 1.5),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
            isExpanded: true,
            value: _chosenValue,
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
              size: 35,
            ),
            items: dropDownItems,
            hint: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(widget.hintText.toString())),
            onChanged: (String? value) {
              setState(() {
                _chosenValue = value;
                fieldValue.text = _chosenValue;
              });
            },
          )),
        ),
      ),
    );
  }
}
