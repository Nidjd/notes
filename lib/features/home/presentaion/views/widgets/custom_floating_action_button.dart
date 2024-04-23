import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';

class CustomFloatingActionButton extends StatefulWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  State<CustomFloatingActionButton> createState() =>
      _CustomFloatingActionButtonState();
}

class _CustomFloatingActionButtonState
    extends State<CustomFloatingActionButton> {
  final titleController = TextEditingController();
  final subjectController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: fourthColor,
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (context) => Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: 'title',
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(
                    hintText: 'subject',
                    controller: titleController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MaterialColorPicker(
                    onColorChange: (Color color) {
                      print(color.toString());
                    },
                    selectedColor: Colors.red,
                    colors: const [
                      Colors.red,
                      Colors.deepOrange,
                      Colors.yellow,
                      Colors.lightGreen
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 300,
                    child: CustomTextButton(
                      text: 'Add',
                      onPressed: () {},
                      color: fourthColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
