import 'package:figure_app/models/figure_model.dart';
import 'package:figure_app/screen/detail/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../home_screen.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.0, bottom: 28.0),
      padding: EdgeInsets.symmetric(horizontal:16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow :[ BoxShadow(
          color: Colors.black.withOpacity(0.075),
          offset: Offset(0.0, 1.0),
          blurRadius: 10.0,
        )
        ],
      ),
      child: TextFormField(
        onTap: ()
        {
          showSearch(context: context, delegate: Search(lstF));
        },
        decoration: InputDecoration(
          icon: SvgPicture.asset('assets/icons/search.svg'),
          hintText: 'Tìm kiếm ...',
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 14.0,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
class Search extends SearchDelegate {
    
    @override
    List<Widget> buildActions(BuildContext context) {
      return <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = "";
          },
        ),
      ];
    }

    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    String selectedResult = "";

    @override
    Widget buildResults(BuildContext context) {
      return Container(
        child: Text(""),
      );
    }

    List<Figure> listExample;
    Search(this.listExample);
    
    List<String> recentList = ["Naruto"];
    @override
    Widget buildSuggestions(BuildContext context) {
      if(listExample.length > 0){
      List<Figure> suggestionList = [];
      for(int i = 0;i<listExample.length;i++)
        {
          if(listExample[i].name.contains(query))
          {
            suggestionList.add(listExample[i]);
          }
        }

      return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              suggestionList[index].name,
            ),
            leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
            onTap: (){

              selectedResult = suggestionList[index].name;
              print(selectedResult);
              //print(_lstFood[index].name +"-" + _lstFood[vitri].name+"=" + _lstFood[vitri].id);
              return Navigator.push(context, MaterialPageRoute(
                            builder: (_) => DetailsScreen(suggestionList[index])
                          ));
             
            },
          );
        },
      );
    }
    else
    {
      return Container(
        child: Text("")
      );
    }
    }
  }
