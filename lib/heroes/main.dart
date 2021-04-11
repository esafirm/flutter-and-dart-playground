import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'repository/heroes_repository.dart' as repo;
import 'hollow_text.dart';
import 'hero_detail_page.dart';
import 'superhero.dart';

const EMPTY_IMAGE =
    "https://vignette.wikia.nocookie.net/yakusokunoneverland/images/3/3c/NoImageAvailable.png/revision/latest/scale-to-width-down/480?cb=20160910192028";

class HeroesPage extends StatefulWidget {
  HeroesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HeroesPageState createState() => new _HeroesPageState();
}

class _HeroesPageState extends State<HeroesPage> {
  final List<Widget> _gridItems = <Widget>[];

  @override
  void initState() {
    super.initState();

    repo.fetchHeroes().then((heroes) => (setState(() {
          heroes.forEach((hero) {
            _gridItems.add(new GridItem.withHero(hero));
          });
          print("Fetch complete! \n$heroes");
        })));
  }

  Widget buildGrid() => _gridItems.isEmpty
      ? new Center(child: new CircularProgressIndicator())
      : new GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          children: this._gridItems,
        );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Heroes Page"),
        ),
        body: buildGrid());
  }
}

class GridItem extends StatelessWidget {
  final SuperHero hero;

  GridItem.withHero(this.hero);

  Widget buildImage(String imageUrl) => new Hero(
        tag: hero.hashCode,
        child: new Container(
          constraints: new BoxConstraints.expand(),
          child: new CachedNetworkImage(imageUrl: imageUrl == null ? EMPTY_IMAGE : imageUrl, fit: BoxFit.cover),
        ),
      );

  Widget buildText(String name) => new Container(
      constraints: new BoxConstraints.expand(),
      child: new Center(
          child: new CustomPaint(
              painter: new HollowText(Colors.black.withAlpha(100), name.substring(0, 1).toUpperCase()))));

  void _handleTap(BuildContext context) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) => new HeroDetailPage(hero: hero)));
  }

  @override
  Widget build(BuildContext context) => new Material(
        child: new Card(
            child: new Stack(
          children: <Widget>[
            buildImage(hero.image),
            buildText(hero.name),
            new Material(
              color: Colors.transparent,
              child: new InkWell(onTap: () => _handleTap(context)),
            )
          ],
        )),
      );
}
