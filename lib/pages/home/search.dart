import 'package:flutter/material.dart';

import '../../models/place.dart';
import '../../services/search.dart';
import '../../widgets/place_card.dart';

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
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    //TODO: fix display bug when keyboard is opened
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 12.0),
                      child: PlaceCard(place: snapshot.data![index]),
                    );
                  },
                ),
              );
          } else if (snapshot.hasError) {
            //TODO: check how to display actual error
            layout = Text("Error");
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
