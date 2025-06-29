import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'main_application.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApplication()
    )
  );
}
