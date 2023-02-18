import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_dropdown.dart';
import 'package:flutter_demo/custom_input.dart';
import 'package:flutter_demo/second_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController landHoldingController = TextEditingController();
  TextEditingController landAreaController = TextEditingController();
  TextEditingController staticfieldValue = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> option = ['Land', 'Ownership'];
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Land Info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CustomInput(
                  label: 'Total Land Holding(Ha)',
                  controller: landHoldingController,
                  hint: 'Enter',
                  isPassword: true,
                  inputType: TextInputType.phone,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid total land';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomInput(
                  label: 'Land Area(Under Cultivation)(Ha)',
                  controller: landAreaController,
                  hint: 'Enter Land Area',
                  inputType: TextInputType.phone,
                  validation: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid total land';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Farming Practice',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: RadioListTile(
                          title: const Text("Chemical"),
                          value: true,
                          groupValue: status,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {
                              status = true;
                            });
                          }),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 170,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: RadioListTile(
                          title: const Text("Natural"),
                          activeColor: Colors.green,
                          value: false,
                          groupValue: status,
                          onChanged: (value) {
                            setState(() {
                              status = false;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Land Ownership',
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(height: 10),
                CustomDropdown(
                  fieldValue: staticfieldValue,
                  hintText: '',
                  options: option,
                ),
                const SizedBox(height: 30),
                DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    dashPattern: const [5, 5],
                    //color: Colors.grey,
                    strokeWidth: 2,
                    child: InkWell(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SecondRoute()),
                          );
                        }
                      },
                      child: Card(
                        //color: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15),
                          child: Center(child: Text("+ADD ANOTHER LAND")),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
