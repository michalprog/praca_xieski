import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Main_window extends StatefulWidget {
  final Function(int) manager;
  const Main_window({Key? key, required this.manager}) : super(key: key);


  @override
  State<Main_window> createState() => _Main_windowState();
}

class _Main_windowState extends State<Main_window> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(child: Text("biblioteka online(admin)"))),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            const Gap(30),
                Container(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {widget.manager(1);},
                      child: Text("lista mozliwych filmow")),
                ),
            const Gap(30),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    widget.manager(2);
                  },
                  child: Text("lista wypozyczen")),
            ),
            const Gap(30),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    widget.manager(3);
                  },
                  child: Text("sekcja klient")),
            ),
            const Gap(30),
            Container(
              height: 50,
              width: 300,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    widget.manager(4);
                  },
                  child: Text("sekcja filmy")),
            ),
           Spacer(),
        Row(
          children: [Spacer(),Text("Tworca Michal Chojnacki")],
        )
          ],
        ),
      ),
    );
  }
}
