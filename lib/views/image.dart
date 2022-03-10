import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:test_image_crop/Utils/utils.dart';
import 'package:image/image.dart' as image;

import '../widgets/field_widget.dart';

class ImageCrop extends StatefulWidget {
  const ImageCrop({Key? key}) : super(key: key);

  @override
  State<ImageCrop> createState() => _ImageCropState();
}

class _ImageCropState extends State<ImageCrop> {
  late Image src;
  Uint8List? data;
  File file = File('/storage/emulated/0/Download/image.jpg');

  TextEditingController xCtrl = TextEditingController();
  TextEditingController yCtrl = TextEditingController();
  TextEditingController wCtrl = TextEditingController();
  TextEditingController hCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: (data != null) ? Image.memory(data!) : Image.file(file),
            ),
            ElevatedButton(
                onPressed: () {
                  var img = image.decodeImage(file.readAsBytesSync());
                  final src = Utils.copyCrop(
                    img!,
                    int.parse(xCtrl.text),
                    int.parse(yCtrl.text),
                    int.parse(wCtrl.text),
                    int.parse(hCtrl.text),
                  );
                  setState(() {
                    data = Uint8List.fromList(image.encodePng(src));
                  });
                },
                child: const Text('Crop Image')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FieldWidget(controller: xCtrl, lable: 'OffsetX'),
                FieldWidget(controller: yCtrl, lable: 'OffsetY'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FieldWidget(controller: wCtrl, lable: 'Width'),
                FieldWidget(controller: hCtrl, lable: 'Height'),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
