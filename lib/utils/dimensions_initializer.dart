
import 'package:flutter/material.dart';

import 'dimensions.dart';

class DimensionsInitializer extends StatefulWidget {
  final Widget child;
  const DimensionsInitializer({Key? key, required this.child}) : super(key: key);

  @override
  State<DimensionsInitializer> createState() => _DimensionsInitializerState();
}

class _DimensionsInitializerState extends State<DimensionsInitializer> {
  bool isInitialized = false;

  void _setDimensions() {
    if (!isInitialized) {
      Dimensions.isMobile =
          MediaQuery.of(context).size.shortestSide < 600;
    }
    isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    _setDimensions();
    return widget.child;
  }
}
