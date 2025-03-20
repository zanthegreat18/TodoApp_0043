import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController taskController = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];
  DateTime? selectedDate;
  bool isDateValid = true;
  final Color customColor = Colors.deepPurple[400]!;

  void showDateTimePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Set Task Date & Time",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, size: 25,)
                  )
                ],
              ),
            ),
            SizedBox(
              height: 180,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.dateAndTime,
                initialDateTime: selectedDate ?? DateTime.now(),
                use24hFormat: false,
                onDateTimeChanged: (DateTime newDateTime){
                  selectedDate = newDateTime;
                  isDateValid = true;
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 160),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: (){
                    setState(() {
                      selectedDate ??= DateTime.now();
                      isDateValid = true;
                    });
                    Navigator.of(context).pop();
                  }, 
                  child: const Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }