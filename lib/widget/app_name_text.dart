import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:shop_users/widget/title_text.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontsize = 30});
  final double fontsize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 6),
      baseColor: const Color.fromARGB(255, 63, 0, 94),
      highlightColor: Colors.purple.shade200,
      child: TitlesTextWidget(lable: "AL-Shboul Shop", fontSize: fontsize),
    );
  }
}
