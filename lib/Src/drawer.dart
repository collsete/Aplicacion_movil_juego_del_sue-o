import 'package:flutter/material.dart';
import 'package:tesis/Src/mision.dart';
import 'package:tesis/Src/mi_planta.dart';
import 'PorfilePage.dart';
import 'itemHub.dart';
import 'my_drawer_header.dart';
import 'notes.dart';
import 'notifications.dart';
import 'dashboard.dart';


 class HomePage extends StatefulWidget {
  @override
  principal_screen createState() => principal_screen();
}

class principal_screen extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.MyHomePage) {
      container = MyHomePage();
    } else if (currentPage == DrawerSections.Perfil) {
      container = PorfilePage();
    } else if (currentPage == DrawerSections.events) {
      container = ItemsHubScreen();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
    } else if (currentPage == DrawerSections.settings) {
      container = settings();
    } else if (currentPage == DrawerSections.dashboard){
        container= DashboardView();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 100, 20, 124),
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Inicio", Icons.emoji_nature_outlined,
              currentPage == DrawerSections.MyHomePage ? true : false),
          menuItem(2, "Perfil", Icons.people_alt_outlined,
              currentPage == DrawerSections.Perfil ? true : false),
          menuItem(3, "Mis arboles", Icons.nature_outlined,
              currentPage == DrawerSections.events ? true : false),
          menuItem(4, "Tienda", Icons.shopping_basket_sharp,
              currentPage == DrawerSections.notes ? true : false),
          menuItem(5, "Misiones", Icons.star,
              currentPage == DrawerSections.settings ? true : false),
          // Nuevo ítem de menú para la sección de Dashboard
          menuItem(6, "Mis estadisticas", Icons.dashboard,
              currentPage == DrawerSections.dashboard ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.MyHomePage;
            } else if (id == 2) {
              currentPage = DrawerSections.Perfil;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.dashboard; // Nuevo bloque para Dashboard
            } else if (id == 7) {
              currentPage = DrawerSections.notifications;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  Perfil,
  events,
  notes,
  settings,
  notifications,
  MyHomePage,
}
