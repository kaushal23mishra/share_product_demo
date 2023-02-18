import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isPassword;
  final Color labelColor;
  final TextInputType inputType;
  final Color textFiledColor;
  final Function()? onChangeCompleted;
  final bool enable;
  final String? Function(String?)? validation;
  final int? maxLength;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;

  const CustomInput(
      {Key? key,
      required this.label,
      this.hint = '',
      this.controller,
      this.isPassword = false,
      this.labelColor = Colors.black,
      this.textFiledColor = Colors.grey,
      this.inputType = TextInputType.text,
      this.onChangeCompleted,
      this.enable = true,
      this.validation,
      this.onTap,
      this.maxLength,
      this.inputFormatters})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  late bool isHide;

  @override
  void initState() {
    isHide = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != '')
          Text(widget.label,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        Material(
          child: TextFormField(
            inputFormatters: widget.inputFormatters,
            maxLength: widget.maxLength,
            enabled: widget.enable,
            //obscureText: isHide,
            onTap: widget.onTap,
            validator: widget.validation,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: widget.inputType,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            controller: widget.controller,
            onEditingComplete: widget.onChangeCompleted,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              isDense: false,
              contentPadding: const EdgeInsets.only(left: 10),
              counterText: '',
              border: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1, color: Colors.grey), //<-- SEE HERE
              ),
              suffixIconConstraints:
                  const BoxConstraints(maxHeight: 40, maxWidth: 120),
              suffixIcon: widget.isPassword
                  ? Container(
                      color: Colors.green.withOpacity(0.1),
                      //padding: const EdgeInsets.all(8.0),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Farmer Type',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  : null,
              hintText: widget.hint,
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
