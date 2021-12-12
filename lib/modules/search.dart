import 'package:abu_zaid/shared/component/component.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  prefix: Icon(Icons.search),
                  label: Text('Search Here !'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
