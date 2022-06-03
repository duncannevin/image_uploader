import 'dart:html';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart';

enum UploadStage { IDLE, UPLOADING, UPLOADED }

class Upload {
  String id;
  String location;

  static Upload jsonDecode(String jsonStr) {
    return json.decode(jsonStr);
  }

  Upload(this.id, this.location);
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

      final response = await HttpRequest.request(_uploaderLocation,
          method: 'POST', sendData: formData).then((value) => value.response);

      print(Upload.jsonDecode(response.toString()));
    } catch (e) {
      print(e.toString());
    } finally {
      stage = UploadStage.UPLOADED;
    }
  }
}
