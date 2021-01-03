import 'package:flutter/material.dart';

class AnimatedHeart extends StatefulWidget {
  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart> with SingleTickerProviderStateMixin {
  bool liked = false;
  AnimationController _likeAnimationController;
  Animation _likeAnimation;

  @override
  void initState() {
    super.initState();
    AnimationController _likeAnimationController =
        AnimationController(duration: Duration(seconds: 2),vsync: this);
    Animation _likeAnimation =
        Tween(begin: 0.0, end: 1.0).animate(_likeAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
  }

  onTap() {
    _likeAnimationController.forward();
    setState(() {
      liked = !liked;
    });
    print("tapped");
    //start animation
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        Icons.favorite,
        color: Colors.red,
        size: 50,
      ),
    );
  }
}
