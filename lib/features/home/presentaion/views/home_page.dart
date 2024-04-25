import 'package:expansion_tile_group/expansion_tile_group.dart';

import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item_builder.dart';

import 'package:notes/features/home/presentaion/views/widgets/custom_floating_action_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: CustomExpansionItemBuilders(
            customExpansionItem: CustomExpansionItem(
              title: 'title',
              subject: 'subject',
              color: Colors.lightBlue,
            ),
          ),
        ),
      ),
    );
  }
}
