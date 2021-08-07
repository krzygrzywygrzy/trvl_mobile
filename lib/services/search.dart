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
          name: "Marcinkowice Hotel",
          description: "JD",
          price: 30,
          photo:
              "https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTd8fGhvdGVsfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        ),
      ),
    );
  }

  void dispose() {
    _searchController.close();
    _phraseController.close();
  }
}
