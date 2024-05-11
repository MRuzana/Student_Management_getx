import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_record_getx/widgets/pick_image.dart';

class ImageController extends GetxController{

  final Rx<Uint8List?> image = Rx(null);

  Future<Uint8List> pickImageController() async {
    Uint8List? imageBytes = await pickImage(ImageSource.gallery);
    image.value = imageBytes;
    update();
    return image.value!;
  }
}