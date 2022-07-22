import 'package:flutter/material.dart';
import 'package:smash_gift/modules/details/details_page.dart';
import 'package:smash_gift/modules/home/country_service.dart';

class CountryListWidget extends StatefulWidget {
  const CountryListWidget({ Key? key }) : super(key: key);

  @override
  State<CountryListWidget> createState() => _CountryListWidgetState();
}

class _CountryListWidgetState extends State<CountryListWidget> {
  dynamic countries = [];
  bool loading = true;

  @override
  void initState() {
    CountryService.getCountries().then((value) {
      setState(() {
        countries = value;
        loading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: Center(child: CircularProgressIndicator(color: Colors.grey)),
      );
    }

    return Column(
      children: [
        for (final country in countries)
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(
                  cities: country['cities'],
                  country: country['country'],
                )),
              );
            },
            child: Container(
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
                    flex: 3,
                    child: Text(
                      country['country'].toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          )
      ],
    );
  }
}