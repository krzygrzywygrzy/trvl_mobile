import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../widgets/search_bar.dart';
import '../profile.dart';
import 'main_view.dart';
import 'search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final phrase = TextEditingController(); //controls searching
  var _status = homeStatus.main;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome back",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: kGray,
                        ),
                      ),
                      Text(
                        "Nickname",
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      //Navigate to ProfilePage after clicking on avatar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePage(),
                        ),
                      );
                    },
                    //TODO: replace this image with actual profile photo
                    child: Hero(
                      tag: "avatar",
                      child: CircleAvatar(
                        backgroundColor: kLightGray,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvwmH8eEz_ydIBe7qBd1djDDR8e4U7LxecFg&usqp=CAU"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              SearchBar(
                controller: phrase,
              ),
              SizedBox(
                height: 18.0,
              ),
              _buildHomePage(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    phrase.addListener(_controllerListener);
    super.initState();
  }

  @override
  void dispose() {
    phrase.removeListener(_controllerListener);
    super.dispose();
  }

  //builds bottom part of HomePage depending on if user searches for places or not
  Widget _buildHomePage() {
    switch (_status) {
      case homeStatus.main:
        return MainView();
      case homeStatus.searching:
        return HomeSearch(
          controller: phrase,
        );
    }
  }

  //sets [_status] of HomePage depending on if user searches for places or not
  void _controllerListener() {
    if (phrase.text.length > 0 && _status == homeStatus.main)
      setState(() {
        _status = homeStatus.searching;
      });
    else if (phrase.text.length == 0 && _status == homeStatus.searching)
      setState(() {
        _status = homeStatus.main;
      });
  }
}
