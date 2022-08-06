import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/screen/cart_page.dart';
import 'package:flutter_application_1/src/screen/chapathicart.dart';
import 'package:flutter_application_1/src/screen/detail_page.dart';
import 'package:flutter_application_1/src/screen/drinkscart.dart';
import 'package:flutter_application_1/src/screen/parotacart.dart';

class Search extends SearchDelegate {
  List<String> data = [
    "meals",
    "parota",
    "chapathi",
    "drinks",
    "tiffins",
    "snacks"
  ];

  List<String> recentSearch = [
    "Meals",
    "Parota",
    "Chapathi",
    "Drinks",
    "Tiffins",
    "Snacks"
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query != null && data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {
          if(query.contains('Meals')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);
          }
          if(query.contains('Parota')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Parotacart()),);
          }
          if(query.contains('Chapathi')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Chapathcart()),);
          }
          if(query.contains('Drinks')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Drinkscart()),);
          }


        },
      );
    } else if (query == "") {
      return Text(" no input");
    } else {
      return ListTile(
        title: Text("No results found"),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentSearch[index]),
            trailing: Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              if(query.contains('Meals')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()),);
          }
          if(query.contains('Parota')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Parotacart()),);
          }
          if(query.contains('Chapathi')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Chapathcart()),);
          }
          if(query.contains('Drinks')){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Drinkscart()),);
          }
          if(query==" "){
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()),);
          }
              //Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()),);
            },
          );
        });
  }
}