import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyGalleryApp extends StatefulWidget {
  const MyGalleryApp({super.key});

  @override
  State<MyGalleryApp> createState() => _MyGalleryAppState();
}

class _MyGalleryAppState extends State<MyGalleryApp> {
  final ImagePicker _imagePicker = ImagePicker();
  List<XFile>? images;

  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    images = await _imagePicker.pickMultiImage();

    if (images != null) {
      Timer.periodic(const Duration(seconds: 5), (time) {
        currentPage++;

        if (currentPage > images!.length - 1) {
          currentPage = 0;
        }

        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      });
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Gallery')),
      body: images == null
          ? const Center(child: Text('No Data'))
          : PageView(
              controller: _pageController,
              children: images!.map((image) {
                return FutureBuilder<Uint8List>(
                  future: image.readAsBytes(),
                  builder: (context, snapshot) {
                    final data = snapshot.data;

                    if (data == null ||
                        snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Image.memory(data, width: double.infinity);
                  },
                );
              }).toList(),
            ),
    );
  }
}
