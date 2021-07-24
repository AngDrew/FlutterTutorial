import 'package:flutter/material.dart';
import 'package:fluttering_with_andrew/src/view_models/base_vm.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.builder,
    this.onReady,
    Key? key,
  }) : super(key: key);

  final Widget Function(BuildContext context, T vm, Widget? child) builder;
  final Future<void> Function(T)? onReady;

  @override
  _BaseViewState<T> createState() => _BaseViewState();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late final T vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<T>();
    if (widget.onReady != null) {
      widget.onReady!(vm);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: widget.builder,
    );
  }
}
