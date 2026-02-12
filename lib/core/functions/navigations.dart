import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customNavigate(BuildContext context, String path) {
  GoRouter.of(context).push(path);
}

void customReplacementNavigate(BuildContext context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customNavigateAndRemoveAll(BuildContext context, String path) {
  GoRouter.of(context).go(path);
}

void customPop(BuildContext context) {
  GoRouter.of(context).pop();
}
