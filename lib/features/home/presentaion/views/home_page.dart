import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: fourthColor,
      onPressed: () {
        Scaffold.of(context).showBottomSheet(
          (context) => Column(
            children: [
              Expanded(
                child: Container(
                  color: thirdColor,
                ),
              ),
            ],
          ),
        );
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
