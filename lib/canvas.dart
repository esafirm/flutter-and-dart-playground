import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawScreenState();
  }
}

class DrawScreenState extends State<DrawScreen> {
  List<Offset> offsets = [];
  ui.Image image;

  @override
  void initState() {
    super.initState();
    imageWithDraw().then((image) {
      setState(() {
        this.image = image;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTapUp: (details) {
          RenderBox object = context.findRenderObject();
          Offset _localPosition = object.globalToLocal(details.globalPosition);

          setState(() {
            offsets.add(_localPosition);
          });
        },
        child: CustomPaint(
            painter: PatternPainter(image: this.image, offsets: offsets),
            size: Size.infinite),
      ),
    );
  }

  Future<ByteData> getAssetImage() async {
    var assetImage = ExactAssetImage('images/cat.png');
    var key = await assetImage.obtainKey(ImageConfiguration());
    final ByteData data = await key.bundle.load(key.name);
    return data;
  }

  Future<ui.Image> loadImage(ByteData data) async {
    var codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    var frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  Future<ui.Image> imageWithDraw() async {
    final ByteData data = await getAssetImage();
    final image = await loadImage(data);
    return image;
  }
}

class PatternPainter extends CustomPainter {
  PatternPainter({@required this.image, @required this.offsets});

  final ui.Image image;
  final List<ui.Offset> offsets;

  final Paint p = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.yellow, BlendMode.src);

    if (image == null) return;

    for (var item in offsets) {
      canvas.drawImage(image, item, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
