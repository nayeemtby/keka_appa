import 'package:flutter/material.dart';

class BtnDrawer extends StatelessWidget {
  final int items;
  final String txt;
  const BtnDrawer(this.txt, {Key? key, this.items = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white30,
      splashFactory: InkRipple.splashFactory,
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              color: Colors.red,
              child: Text(
                items.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BtnDrawerIcon extends StatelessWidget {
  final String txt;
  final IconData icon;
  const BtnDrawerIcon({Key? key, required this.txt, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.white30,
      splashFactory: InkRipple.splashFactory,
      onTap: () {},
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        title: Text(
          txt,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
