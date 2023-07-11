import 'package:demo0/screens/First_Page.dart';
import 'package:demo0/screens/Secont_page.dart';
import 'package:demo0/screens/camerascreen.dart';
import 'package:demo0/widgets/apptext.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pagecontroller=PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pagecontroller = PageController(
      initialPage: 0,
      keepPage: true,
      viewportFraction: 1,
    );
  }
  @override
  void dispose() {
    _pagecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: PageController(),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          reverse: true,
          onPageChanged: (index){
            print("$index");
          },
          children:<Widget> [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: PageView(
                controller: _pagecontroller,
                children: [

                  FirstPage(),
                  CameraScreen(),




                ],
              ),
            )
          ],
        )

      ),


    );
  }
}
