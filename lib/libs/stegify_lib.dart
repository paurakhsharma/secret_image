import 'dart:io';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_stegify/flutter_stegify.dart';

class StegifyLib {
  Future<String> saveImage(inputImage, secretMessage) async {

    final directory = await getApplicationDocumentsDirectory();
    var inputImageLoc = directory.path + '/' + 'input.jpg';
    var inputFileLoc = directory.path + '/' + 'input.txt';
    var resultImageLoc = directory.path + "/result.png";
    List<int> imageBytes = await inputImage.readAsBytes();
    print('imagesBypes $imageBytes');
    // save input image
    await File(inputImageLoc).writeAsBytes(imageBytes);
    print('Input image saved');

    // save input text
    await File(inputFileLoc).writeAsString(secretMessage);
    print('Input text saved');

    print('image location: ${resultImageLoc.toString()}');
    // encode
    await Stegify.encode(inputImageLoc, inputFileLoc, resultImageLoc);
    var result = await ImageGallerySaver.saveFile(resultImageLoc);
    print('save result: $result');
    print('Encoded');
    return result;
  }

  Future<String> decodeImage(image) async {
    final directory = await getApplicationDocumentsDirectory();
    var inputImageLoc = directory.path + '/' + 'input.jpg';
    List<int> imageBytes = await image.readAsBytes();


    // save input decode image
    await File(inputImageLoc).writeAsBytes(imageBytes);
    await Stegify.decode(inputImageLoc, directory.path + '/' + 'result.txt');
    print('decoding complete');

    return File(directory.path + '/' + 'result.txt').readAsString();
  }
}