import 'package:image/image.dart';
import 'package:image/image.dart' as image;

class Utils {
  static Image copyCrop(Image src, int x, int y, int w, int h) {
    return image.copyCrop(src, x, y, w, h);
  }
}
