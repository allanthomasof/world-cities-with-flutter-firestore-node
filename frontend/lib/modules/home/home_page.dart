import 'package:flutter/material.dart';
import 'package:smash_gift/modules/home/widgets/country_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF37235E),
        title: Text(title),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: const CountryListWidget(),
        ),
      ),
    );
  }
}
