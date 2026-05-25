import 'package:e301_login/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class BlackViews extends StatelessWidget {
  const BlackViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Black view', style: CustomLabels.h1)),
    );
  }
}
