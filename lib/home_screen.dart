import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController linkController = TextEditingController(
  //     text:
  //         'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
  TextEditingController linkController = TextEditingController();
  bool _isLoading = false;

  Future<Directory?>? _tempDirectory;
  dynamic image;
  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/images/featured_image.png');
  }

  dynamic videoLink;
  dynamic fileName;
  dynamic videoThumbnail;

  void _getThumbnail(videoLink) async {
    setState(() {
      _isLoading = !_isLoading;
    });
    Image.network('https://img.youtube.com/vi/z9MPQUxWl8Q/0.jpg');

    // get package
    print("Triggered!");

    if (videoLink.contains('http')) {
      var b = 'https://img.youtube.com/vi/z9MPQUxWl8Q/0.jpg';
      // var regexp = RegExp(r"(?<=\h).+?(?=\:)");
      var regexp = RegExp(r".*\?v=(.+?)&.+");
      print(regexp.hasMatch(b)); // true
      print(regexp.firstMatch(b)?.group(0));
    }
    try {
      final fileName = await VideoThumbnail.thumbnailFile(
        video: videoLink,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.WEBP,
        maxHeight:
            64, // specify the height of the thumbnail, let the width auto-scaled to keep the source aspect ratio
        quality: 75,
      );

      // compressVideo() async {
      //   final compressVideo = await VideoCompress.compressVideo(videoLink,
      //       quality: VideoQuality.LowQuality);

      //   return compressVideo;
      // }

      // getThumbnail(compressVideo) async {
      //   final thumbnail = await VideoCompress.getFileThumbnail(compressVideo);
      //   return thumbnail;
      // }

      // fileName = await compressVideo();
      print("====> File name || $fileName");

// if (await imageFile.exists()) {
//   // Use the cached images if it exists
// } else {
//   // Image doesn't exist in cache
//   await imageFile.create(recursive: true);
//   // Download the image and write to above file
//   ...
// }

      void main() {
        String myString = 'https://www.youtube.com/watch?v=z9MPQUxWl8Q';

// just like i can do the following check
        myString.contains('youtu')
            ? print('validate')
            : print('does not validate');

// I want to do another check here
        // !myString.contains('https://youtu.be')
        //     ? print('does not validate')
        //     : print('validate');
      }

      var quest = '?';
      if (videoLink.contains('https://youtu.be/')) {
        var b = videoLink;
        var regexp = RegExp(r"(?<=\e).+?(?=\?)");
        print(regexp.hasMatch(b)); // true
        image = Image.network('${regexp.firstMatch(b)?.group(0)}');
      }

      if (videoLink.contains('https://www.youtube.com/watch?v=')) {
        quest = '?';
        var b = '$videoLink$quest';
        var regexp = RegExp(r"(?<=\=).+?(?=\?)");
        print(regexp.hasMatch(b)); // true
        image = Image.network('${regexp.firstMatch(b)?.group(0)}');
      }

      main();

      setState(() {
        // image = Image(image: AssetImage(fileName!));
        image = Image.file(
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
            scale: 0.5,
            cacheWidth: 400,
            cacheHeight: 600,
            File('$fileName'));
        _isLoading = !_isLoading;
      });
    } catch (e, s) {
      print(e.toString());
      print('_____StackTrace_____: $s');
    }

    // extract thumbnail

    // assign to image link
  }

  @override
  Widget build(BuildContext context) {
    // Image localImage = Image.asset('assets/images/featured_image.png');
    // Image networkImage = Image.network(videoThumbnail);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // title
              Container(
                margin: const EdgeInsets.only(top: 50, left: 16),
                height: 100,
                width: double.maxFinite,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.purple[200]!.withOpacity(0.3),
                    offset: Offset.zero,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.normal,
                  )
                ]),
                child: const Text(
                  'THUMBNAIL GETTER',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              //image
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: 190,
                width: 480,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.purple[900]!.withOpacity(0.1),
                    offset: Offset.zero,
                    blurRadius: 5,
                    spreadRadius: 2,
                    blurStyle: BlurStyle.normal,
                  )
                ]),
                child: _isLoading == true
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: LinearProgressIndicator(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.1),
                        ))
                    : image,
              ),

              //input field
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 3,
                          spreadRadius: 1,
                          offset: const Offset(1, 2),
                          color: Colors.grey.withOpacity(0.2))
                    ]),
                child: TextFormField(
                  style: TextStyle(color: Colors.black.withOpacity(0.85)),
                  controller: linkController,
                  keyboardType: TextInputType.number,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.zero,
                      borderSide: BorderSide.none,
                    ),
                    // labelText: "Email",
                    hintText: "Enter video link",
                    contentPadding: EdgeInsets.all(12),
                    // errorText: ? 'Please'
                  ),
                  // validator: (value) => EmailValidator.validate(value!) ? null : 'Please enter a valid email!',
                ),
              ),

              // submit button
              Container(
                height: 50,
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 30, right: 20, left: 20),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.3),
                    offset: Offset.zero,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    blurStyle: BlurStyle.normal,
                  )
                ]),
                child: ElevatedButton(
                    onPressed: () {
                      if (linkController.text.isNotEmpty) {
                        videoLink = linkController.text;
                        _getThumbnail(videoLink);
                      } else {
                        print("No link found");
                      }
                    },
                    child: Text('Get Thumnail')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
