import 'package:flutter/material.dart';
import 'package:openai_mobile/core/extensions/context_extensions.dart';

import '../constants/application_constants.dart';
import '../constants/shadow_constant.dart';

class PinkButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;

  const PinkButton({Key? key, this.onTap, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 50,
        height: context.height * 5,
        decoration: BoxDecoration(
            color: const Color(0xffFF007F),
            borderRadius:
                BorderRadius.all(Radius.circular(ApplicationConstants.radius)),
            boxShadow: [ShadowConstant.boxShadow]),
        child: Center(child: child),
      ),
    );
  }
}
