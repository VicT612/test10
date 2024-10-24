import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:test10/main.dart';

class WebPage extends StatefulWidget {
  const WebPage({super.key});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  static const List<String> imagesList = [
    'assets/images/ima1.jpeg',
    'assets/images/ima2.jpeg',
    'assets/images/ima3.jpeg',
    'assets/images/ima4.jpeg',
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _cerrarSesion() async {
    await _auth.signOut();
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MENU",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 55, 67),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 27, 59, 85),
              ),
              child: Text(
                'USUARIO',
                style: TextStyle(
                  color: const Color.fromARGB(255, 252, 254, 255),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.pages),
              title: Text('Configuración'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Cerrar Sesión'),
              onTap: _cerrarSesion,
            ),
          ],
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'UPDS',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 15, 11, 95),
                        decoration: TextDecoration.underline),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    width: screenWidth * 0.9,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              imagesList[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                      itemCount: imagesList.length,
                      pagination: const SwiperPagination(),
                      control: const SwiperControl(),
                      autoplay: true,
                      viewportFraction: 0.8,
                      scale: 0.9,
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    "ULTIMAS NOTICIAS",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/imas1.jpg',
                            width: 400, height: 200),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Publican artículo escrito por docente de la UPDS sobre el dilema del dólar en Bolivia en revista científica internacional",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 14, 8, 51))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/imas2.jpg',
                            width: 400, height: 200),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Destacada representación de la UPDS en Congreso Internacional Multidisciplinario de Investigación en Paraguay",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 14, 8, 51))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/imas3.jpg',
                            width: 400, height: 200),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Exitosa Jornada Pedagógica sobre Innovación Educativa con Inteligencia Artificial en la UPDS",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 14, 8, 51))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/imas4.jpg',
                            width: 400, height: 200),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Éxito en el Encuentro de Profesionales en Psicopedagogía y Psicología en la UPDS: Neuroeducación e Inteligencia Artificial al Servicio del Éxito Académico",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: const Color.fromARGB(255, 14, 8, 51))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
