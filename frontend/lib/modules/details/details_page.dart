import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String country;
  final dynamic cities;
  const DetailsPage({Key? key, required this.cities, required this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF37235E),
        title: Text(country),
        elevation: 1,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (final city in cities)
            Container(
              margin: const EdgeInsets.only(bottom: 2),
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              alignment: Alignment.centerLeft,
              height: 60,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      city,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}