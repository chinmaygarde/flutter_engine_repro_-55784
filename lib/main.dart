import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: VideoHomePage()
    );
  }
}

class VideoHomePage extends StatefulWidget {
  @override
  _VideoHomePageState createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {

  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    // use any video you have
    _videoPlayerController = VideoPlayerController.asset("videos/video.mp4");
    _videoPlayerController.setLooping(true);
    _videoPlayerController.play();
    _videoPlayerController.initialize();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Material(
        type: MaterialType.transparency,
        elevation: 0,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Container(
              // these are the dimensions of my video
              width: 818.0,
              height: 864.0,
              child: VideoPlayer(_videoPlayerController)
          ),
        ),
    );
  }
}
