import 'package:example/core/index.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final Widget child;

  const CustomCard({
    super.key,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: const [
          BoxShadow(
            blurRadius: 1,
            color: AppColor.neutral30,
          ),
        ],
      ),
      child: Material(
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
