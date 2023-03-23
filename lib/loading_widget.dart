import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget loadingWidget() {
  return SizedBox(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LoadingAnimationWidget.inkDrop(
          color: Colors.pink,
          size: 40,
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Mohon Tunggu \nSedang Mengambil Data",
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
}
