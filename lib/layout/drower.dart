import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ListView(
        shrinkWrap: true,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: (MediaQuery.of(context).size.height / 5),
            child: Text('PUT YOUR LOGO HERE'),
          ),
          ListTile(
            leading: Icon(Icons.home,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('بيع الجملة'),
            trailing: Text('New',
                style: TextStyle(color: Theme.of(context).primaryColor)),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/shop');
            },
          ),
          ListTile(
            leading: Icon(Icons.category,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('الاصناف'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/categorise');
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('أعجبني'),
            trailing: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('4',
                  style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/wishlist');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('سلة المشتريات '),
            trailing: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Text('2',
                  style: TextStyle(color: Colors.white, fontSize: 10.0)),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/cart');
            },
          ),
          ListTile(
            leading: Icon(Icons.lock,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('تسجيل الدخول'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/auth');
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('الاعدادات'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            },
          ),
          ListTile(
            leading: Icon(Icons.info,
                color: Theme.of(context).colorScheme.secondary),
            title: const Text('المُطور'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    ]);
  }
}
