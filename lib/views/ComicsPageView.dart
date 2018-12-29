import 'package:flutter/material.dart';
import 'package:marvel/pages/ComicsPage.dart';
import 'ComingSoonView.dart';
class ComicsPageView extends ComicsPageState {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ComingSoonView()
          ],
        ),
      ),
    );
  }

}
