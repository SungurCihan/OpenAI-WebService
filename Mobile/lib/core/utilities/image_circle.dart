import 'package:flutter/material.dart';
import 'package:openai_mobile/core/extensions/context_extensions.dart';

class ImageCircle extends StatelessWidget {
  const ImageCircle({super.key, required this.isSelected});
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor:
            context.colorScheme.primary.withOpacity(isSelected ? 1 : 0.2),
        radius: isSelected ? context.width * 2 : context.width * 1.5,
      ),
    );
  }
}
