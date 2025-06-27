import 'package:fake_store/presentation/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class LoaderView extends StatefulWidget {
  const LoaderView({super.key});

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: LoaderWidget()));
  }
}
