import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_video_info/flutter_video_info.dart';

void main() {
  runApp(MyApp());
}

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  VideoData? info;
  final videoInfo = FlutterVideoInfo();

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('path: ${info?.path}'),
            Text('geotag: ${info?.location}'),
            ElevatedButton(
              onPressed: () async {

                final ImagePicker _picker = ImagePicker();
                final XFile? image = await _picker.pickVideo(source: ImageSource.gallery);
                if(image != null){
                  videoInfo.getVideoInfo(image.path).then((result){
                    setState((){
                      info = result;
                    });
                  });
                }
              },
              child: Text('pick video'),
            ),
          ],
        ),
      )
    );
  }
}