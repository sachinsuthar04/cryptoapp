import 'package:cryptoapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    Key? key,
    required this.page,
  }) : super(key: key);
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () {
        if (context.canPop()) {
          context.pop();
        } else {
          context.goNamed(DynamicRoutes.home.name);
        }
        return Future.value(false);
      },
      child: page,
    ));
  }
}
