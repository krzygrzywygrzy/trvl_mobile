import 'package:flutter/material.dart';

import '../../models/place.dart';
import '../../services/search.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  SearchService _searchService = SearchService();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: _searchService.resultStream,
        builder: (BuildContext context, AsyncSnapshot<List<Place>> snapshot) {
          Widget layout = Container();

          if (snapshot.hasData) {
            if (snapshot.data?.length == 0)
              layout = Text("no results");
            else
              layout = Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    //TODO: make card to display results
                    return Text(snapshot.data![index].name);
                  },
                ),
              );
          }
          return layout;
        },
      ),
    );
  }

  @override
  void initState() {
    widget.controller.addListener(_phraseListener);
    super.initState();
  }

  @override
  void dispose() {
    _searchService.dispose();
    widget.controller.removeListener(_phraseListener);
    super.dispose();
  }

  void _phraseListener() =>
      _searchService.phraseSink.add(widget.controller.text);
}
