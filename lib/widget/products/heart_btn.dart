import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HeartButtonWidget extends StatefulWidget {
  const HeartButtonWidget({super.key,  this.size=22});
final double size;
  @override
  State<HeartButtonWidget> createState() => _HeartButtonWidgetState();
}

class _HeartButtonWidgetState extends State<HeartButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal.shade200,
      shape: const CircleBorder(),
      child: IconButton(
        onPressed: () {},
        icon:  Icon(IconlyLight.heart,size: widget.size,),
      ),
    );
  }
}
