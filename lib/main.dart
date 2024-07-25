import 'package:flutter/material.dart';

main()
{
  runApp(Animation_App());
}

class Animation_App extends StatelessWidget
{
  @override
  Widget build(BuildContext buildContext)
  {
    return MaterialApp(
      color: Colors.green,
      title: "Animation App",
      debugShowCheckedModeBanner: false,
      home: Animation_App_Page(),
    );
  }
}

class Animation_App_Page extends StatefulWidget
{
  @override
  State<Animation_App_Page> createState() => Animation_App_Page_State();
}

class Animation_App_Page_State extends State<Animation_App_Page>
{
  var _containerWidth = 250.0;
  var _containerHeight = 125.0;
  var _sizeFlag = true;  // this use for toggling means Animated-Container dynamic size.
  // Color _containerColor = Colors.red;
  Decoration _containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Colors.red,
  );

  @override
  Widget build(BuildContext buildContext)
  {
    return Scaffold(
      primary: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        primary: true,
        backgroundColor: Colors.green,
        title: Text("Animation App", style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white ),),
        elevation: 5,
        centerTitle: true,
        titleSpacing: 7,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration( seconds: 3 ),
              width: _containerWidth,
              height: _containerHeight,
              decoration: _containerDecoration,
              curve: Curves.slowMiddle,
            ),
            SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              if( _sizeFlag ) {
                _containerWidth = 125.0;
                _containerHeight = 250.0;
                _sizeFlag = false;
                _containerDecoration = BoxDecoration(
                  borderRadius: BorderRadius.circular( 20 ),
                  color: Colors.green,
                );
              }
              else
                {
                  _containerWidth = 250.0;
                  _containerHeight = 125.0;
                  _sizeFlag = true;
                  _containerDecoration = BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.red,
                  );
                }
              setState(() {});
            }, child: Text("Animate", style: TextStyle( fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black87 )))
          ],
        ),
      ),
    );
  }
}