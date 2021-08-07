import 'dart:async';

import '../models/place.dart';

class SearchService {
  //results stream
  StreamController<List<Place>> _searchController = StreamController();
  Stream<List<Place>> get resultStream => _searchController.stream;
  Sink<List<Place>> get _resultSink => _searchController.sink;

  //phrase stream
  StreamController<String> _phraseController = StreamController();
  Sink<String> get phraseSink => _phraseController.sink;

  SearchService() {
    _phraseController.stream.listen(_searchForPhrase);
  }

  void _searchForPhrase(String phrase) async {
    //TODO: make async api call

    _resultSink.add(
      List.generate(
        phrase.length,
        (index) => Place(
          name: "Marcinkowice City",
          description: "JD",
        ),
      ),
    );
  }

  void dispose() {
    _searchController.close();
    _phraseController.close();
  }
}
