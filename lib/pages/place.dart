import 'package:flutter/material.dart';

import '../models/place.dart';

class PlacePage extends StatefulWidget {
  const PlacePage({
    Key? key,
    required this.place,
  }) : super(key: key);

  final Place place;

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Hero(
            tag: "place_image_${widget.place.name}",
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  //TODO: null safety check
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.place.photo!),
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 10,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 20,
                      child: Text(
                        widget.place.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          decoration: TextDecoration.none,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
