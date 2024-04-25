import 'package:flutter/material.dart';
import 'package:notes/features/home/presentaion/views/widgets/custom_expansion_item.dart';

class CustomExpansionItemBuilders extends StatelessWidget {
  const CustomExpansionItemBuilders({
    super.key, required this.customExpansionItem,
  });

  final CustomExpansionItem customExpansionItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => customExpansionItem,
      itemCount: 10,
    );
  }
}
