import 'package:alt_access/styling/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../widgets/side_drawer.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  ClientHomeState createState() => ClientHomeState();
}

class ClientHomeState extends State<ClientHome> {
  Image image1 = Image.asset("assets/Client back.jpeg");
  @override
  void initState() {
    super.initState();
    image1 = Image.asset("assets/Client back.jpeg");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(image1.image, context);
  }

  Widget _widget() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text(
          "Hello",
          style: TextStyle(color: Colors.white),
        ),

        backgroundColor: Colors.transparent,
        elevation: 0.0,
        // scrolledUnderElevation: scrolledUnderElevation,
        //shadowColor: true ? Theme.of(context).colorScheme.shadow : null,
      ),
      drawer: SideDrawer(
          login: true,
          press: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ClientHome()));
          }),
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: image1.image,
            fit: BoxFit.fill,
          ),
          //  gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [
          //       Color(0x8080D3FF),
          //       Color(0xB78BA9AF),
          //     ],
          //
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StaggeredGrid.count(
            crossAxisCount: 4,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 26.0,
            children: <Widget>[
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child:
                    Title("Welcome To Alt Access", "Redefining Access Control"),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: myTextItems("Total Agents", "20"),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: myTextItems("Total Locks", "10"),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 4,
                mainAxisCellCount: 2,
                child: myTextItems("Number of QR Generated", "10"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material myTextItems(
    String title,
    String subtitle,
  ) {
    return Material(
      color: Colors.white54,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: const Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.settings_suggest,
                      color: Constants.Gold,
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material Title(String title, String subtitle) {
    return Material(
      color: Colors.transparent,
      elevation: 1.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Color(0xFFFAFAFA),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final md = MediaQuery.of(context);
    if (md.orientation == Orientation.landscape) {
      return _widget();
    }
    return _widget();
  }

  @override
  void dispose() {
    //controller.dispose();
    super.dispose();
  }
}
