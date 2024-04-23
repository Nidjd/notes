import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const CustomFloatingActionButton(),
      body: SafeArea(
          child: ExpansionTileItem(
        title: Text(
          'data',
          style: TextStyle(color: Colors.grey[900]),
        ),
        backgroundColor: thirdColor,
        decoration: const BoxDecoration(
          color: Colors.amberAccent,
        ),
        children: const [Text('hello my name is Mohammed,')],
      )),
    );
  }
}
