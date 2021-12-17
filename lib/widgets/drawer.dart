import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/logo_light.png'),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Dashboard'),
            onTap: () => {
              // TODO: Change to dashboard
            },
          ),
          ListTile(
            leading: Icon(
              Icons.priority_high,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Puzzels'),
            onTap: () => {
              // TODO: Change to puzzels
            },
          ),
          ListTile(
            leading: Icon(
              Icons.build,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Blocky'),
            onTap: () => {
              // TODO: Change to blocku
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).iconTheme.color,
            ),
            title: const Text('Settings'),
            onTap: () => {
              // TODO: Change to dashboard
            },
          ),
        ],
      ),
    );
  }
}
