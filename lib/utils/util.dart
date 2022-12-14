import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagesPicker = ImagePicker();
  XFile? _file = await _imagesPicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  }
  print("No images selected ");
}

ShowSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
