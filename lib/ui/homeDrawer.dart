import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef OnDrawerItemClicked = void Function(DrawerMenuItem drawerMenuItem);

class HomeDrawer extends StatefulWidget {
  OnDrawerItemClicked onDrawerItemClicked;

  HomeDrawer({required this.onDrawerItemClicked});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 55),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                "News App",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              )),
          InkWell(
            onTap: () {
              widget.onDrawerItemClicked(DrawerMenuItem.categories);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.black,
                    size: 33,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.categories,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.onDrawerItemClicked(DrawerMenuItem.settings);
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 33,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppLocalizations.of(context)!.settings,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum DrawerMenuItem { categories, settings }
