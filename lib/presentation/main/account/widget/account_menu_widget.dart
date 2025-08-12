import 'package:example/core/index.dart';
import 'package:flutter/material.dart';

class AccountMenuWidget extends StatelessWidget {
  final String icon;
  final String title;
  final bool isFirst;
  final bool isLast;
  final VoidCallback onTap;
  const AccountMenuWidget({
    super.key,
    required this.icon,
    required this.title,
    this.isFirst = false,
    this.isLast = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(isFirst ? 6 : 0),
        topRight: Radius.circular(isFirst ? 6 : 0),
        bottomLeft: Radius.circular(isLast ? 6 : 0),
        bottomRight: Radius.circular(isLast ? 6 : 0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(isFirst ? 6 : 0),
          topRight: Radius.circular(isFirst ? 6 : 0),
          bottomLeft: Radius.circular(isLast ? 6 : 0),
          bottomRight: Radius.circular(isLast ? 6 : 0),
        ),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    // Image.asset('public/icons/$icon.png', width: 20),
                    const Icon(Icons.menu, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style:
                          styleParagraph1.copyWith(color: AppColor.neutral60),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}
