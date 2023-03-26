import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('Đang tải'),
          LoadingAnimationWidget.prograssiveDots(
            color: Colors.black,
            size: 20,
          ),
        ],
      )
    );
  }
}
