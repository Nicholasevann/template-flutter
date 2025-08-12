import 'package:example/core/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final bool disable;
  final bool visible;
  final bool filled;
  final double fontSize;
  final double borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color = AppColor.primary,
    this.textColor = AppColor.white,
    this.isLoading = false,
    this.disable = false,
    this.visible = true,
    this.filled = true,
    this.fontSize = 16,
    this.borderRadius = 8,
    this.margin,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return visible
        ? Container(
            width: double.maxFinite,
            margin: margin,
            child: MaterialButton(
              elevation: 0,
              padding: padding,
              onPressed: disable || isLoading ? null : onPressed,
              disabledColor: filled ? color.withOpacity(0.4) : null,
              color: disable || isLoading
                  ? color.withOpacity(0.4)
                  : filled
                      ? color
                      : null,
              textColor: textColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: BorderSide(
                  width: filled ? 0 : 1,
                  color: disable || isLoading ? color.withOpacity(0.4) : color,
                ),
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CupertinoActivityIndicator(
                        color: color,
                      ),
                    )
                  : Text(
                      label,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          )
        : Container();
  }
}
