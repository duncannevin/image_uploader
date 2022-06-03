import 'dart:html';
import 'dart:convert';
import 'dart:async';

enum UploadStage { IDLE, UPLOADING, UPLOADED, FAIL }

class Upload {
  String id;
  String location;

  Upload.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        location = json['location'];
}

final UPLOADER_LOCATION = const String.fromEnvironment('uploaderLocation',
    defaultValue: 'http://localhost:3000');

class UploaderService {
  String uploadedImg = '';

  UploadStage stage = UploadStage.IDLE;

  void reset() {
    stage = UploadStage.IDLE;
    uploadedImg = '';
  }

  Future<void> uploadImage(File file) async {
    try {
      stage = UploadStage.UPLOADING;
      var formData = FormData();
      formData.appendBlob('img', file);

      final request = await HttpRequest.request(UPLOADER_LOCATION,
          method: 'POST', sendData: formData);

      uploadedImg = Upload.fromJson(jsonDecode(request.response)).location;
      stage = UploadStage.UPLOADED;
    } catch (e) {
      print(e.toString());
      stage = UploadStage.FAIL;
    }
  }
}
