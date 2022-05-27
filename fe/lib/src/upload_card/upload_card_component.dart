import 'dart:html';

import 'package:angular/angular.dart';
import 'package:fe/src/card/card_component.dart';
import 'package:fe/src/choose_file/choose_file_component.dart';
import 'package:fe/src/drop_zone/drop_zone_component.dart';
import 'package:fe/src/uploader_service.dart';
import 'package:fe/src/uploading_card/uploading_card_component.dart';

@Component(
  selector: 'upload-card',
  templateUrl: 'upload_card_component.html',
  styleUrls: ['upload_card_component.css'],
  directives: [DropZone, UploadingCard, ChooseFile, Card],
)
class UploadCard {
  final UploaderService _uploaderService;

  UploadCard(this._uploaderService);

  void handleFile(File file) {
    _uploaderService.uploadImage(file);
  }
}
