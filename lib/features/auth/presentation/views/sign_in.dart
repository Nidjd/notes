import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notes/constants.dart';

import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/widgets/custom_text_button.dart';
import 'package:notes/core/widgets/custom_text_form_field.dart';
import 'package:notes/features/auth/presentation/views/widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInBody(),
    );
  }
}
