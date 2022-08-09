

import 'dart:async';

import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final delay;
  final child;
  final isHorizontal;

  const FadeAnimation(
      {int? this.delay, Widget? this.child, this.isHorizontal = false});

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late Animation _fadeAnimation;
  late Animation _slideAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {});
      });

    _slideAnimation = Tween<double>(begin: 50, end: 0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {});
      });
    Timer(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        _animationController.forward().orCancel;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _fadeAnimation.value,
      child: Transform.translate(
        offset: widget.isHorizontal
            ? Offset(_slideAnimation.value, 0)
            : Offset(0, _slideAnimation.value),
        child: widget.child,
      ),
    );
  }
}