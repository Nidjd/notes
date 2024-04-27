import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/widgets/custom_progress_indicator.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';
import 'package:notes/features/home/presentaion/views/manager/add_note_cubit/add_note_cubit.dart';

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
  int newColor = 4281559326;

  @override
  void dispose() {
    titleController.dispose();
    subjectController.dispose();
    super.dispose();
  }

  void addNote(color) async {
    await BlocProvider.of<AddNoteCubit>(context).addNote(
        title: titleController.text,
        subject: subjectController.text,
        color: color,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNoteCubit, AddNoteState>(
      builder: (context, state) {
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
                        controller: subjectController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MaterialColorPicker(
                        onColorChange: (Color color) {
                          newColor = color.value;
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
                      state is AddNoteLoadingState
                          ? const CustomProgressIndicator()
                          : SizedBox(
                              width: 300,
                              child: CustomTextButton(
                                text: 'Add',
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    addNote(newColor);
                                  }
                                  titleController.clear();
                                  subjectController.clear();
                                  // GoRouter.of(context).pop();
                                },
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
      },
    );
  }
}
