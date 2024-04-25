
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:notes/core/utils/assets.dart';
import 'package:notes/core/utils/router_app.dart';
import 'package:notes/features/splash_screen/presentation/views/widgets/custom_slide_transition.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({
    super.key,
   
  });

 

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            DataAssets.logo,
            height: 110,
          ),
          const SizedBox(
            height: 12,
          ),
          CustomSlideTransition(slidingAnimation:slidingAnimation),
        ],
      ),
    );
  }

  void navigateToHome()async {
  await Future.delayed(
      const Duration(seconds: 3),
      () {
        (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified) ? GoRouter.of(context).push(AppRouter.kHomeRoute) :
            
        GoRouter.of(context).push(AppRouter.kSignInRoute);
      },
    );
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 5),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
