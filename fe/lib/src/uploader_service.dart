import 'dart:html';

enum UploadStage { IDLE, UPLOADING, UPLOADED }

class UploaderService {
  String uploadedImg = '';

  UploadStage stage = UploadStage.IDLE;

  void uploadImage(File file) {
    stage = UploadStage.UPLOADING;
    uploadedImg = file.relativePath;
    stage = UploadStage.UPLOADED;
  }
}
