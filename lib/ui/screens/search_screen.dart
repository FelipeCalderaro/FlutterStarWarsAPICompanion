import 'package:flutter/material.dart';

class SearchScreen extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () => buildResults(context),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Resultados'),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Sugestoes'),
      ),
    );
  }
}
