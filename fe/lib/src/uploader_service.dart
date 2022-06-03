import 'dart:html';
import 'dart:convert';
import 'dart:async';

enum UploadStage { IDLE, UPLOADING, UPLOADED }

class Upload {
  String id;
  String location;

  Upload.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    location = json['location'];
}

class UploaderService {
  static final _headers = {'Content-Type': 'multipart/form-data'};
  static final _uploaderLocation = 'http://localhost:3000';

  String uploadedImg = '';

  UploadStage stage = UploadStage.IDLE;

  Future<void> uploadImage(File file) async {
    try {
      stage = UploadStage.UPLOADING;
      var formData = FormData();
      formData.appendBlob('img', file);

      final request = await HttpRequest.request(_uploaderLocation,
          method: 'POST', sendData: formData);

      uploadedImg = Upload.fromJson(jsonDecode(request.response)).location;
    } catch (e) {
      print(e.toString());
    } finally {
      stage = UploadStage.UPLOADED;
    }
  }
}
