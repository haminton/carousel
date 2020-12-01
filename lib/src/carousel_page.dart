import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  final PageController _pageController = new PageController();

  final Map<String, dynamic> _data = {
    '1': {
      'image': 'assets/image01.png',
      'title': 'Este es\nel titulo de la pagina uno',
      'description': 'Esta es la descripcion de la pagina uno'
    },
    '2': {
      'image': 'assets/image02.png',
      'title': 'Este es\nel titulo de la pagina dos',
      'description': 'Esta es la descripcion de la pagina dos'
    },
    '3': {
      'image': 'assets/image03.png',
      'title': 'Este es\nel titulo de la pagina tres',
      'description': 'Esta es la descripcion de la pagina tres'
    },
  };

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages(),
        onPageChanged: (int i) {
          page = i;
          setState(() {});
          print('la pagina $page');
        },
      ),
      floatingActionButton: _boton(),
    );
  }

  Widget _page(String image, String title, String description) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: double.infinity,
          ),
          _text(title, true),
          _text(description, false),
          _guia()
        ],
      ),
    );
  }

  List<Widget> _pages() {
    List<Widget> list = new List();
    _data.forEach((key, value) {
      list.add(_page(value['image'], value['title'], value['description']));
      //print('La key es: $key y el value es: $value');
    });
    return list;
  }

  Widget _text(String text, bool isTitle) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: (isTitle) ? 30.0 : 20.0,
            fontWeight: (isTitle) ? FontWeight.w600 : FontWeight.normal),
      ),
    );
  }

  Widget _guia() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          _puntero((page == 0) ? Colors.black : Colors.grey),
          _puntero((page == 1) ? Colors.black : Colors.grey),
          _puntero((page == 2) ? Colors.black : Colors.grey),
        ],
      ),
    );
  }

  Widget _puntero(Color color) {
    return Container(
      margin: EdgeInsets.only(right: 5.0),
      width: 20.0,
      height: 5.0,
      color: color,
    );
  }

  Widget _boton() {
    return FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_right_alt),
        onPressed: () {
          //print('Click');
          _pageController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        });
  }
}
