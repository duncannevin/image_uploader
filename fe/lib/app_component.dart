import 'package:angular/angular.dart';
import 'package:fe/src/copy-input/copy_input_component.dart';
import 'package:fe/src/upload_card/upload_card_component.dart';
import 'package:fe/src/uploaded_card/uploaded_card_component.dart';
import 'package:fe/src/uploader_service.dart';
import 'package:fe/src/uploading_card/uploading_card_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  providers: [ClassProvider(UploaderService)],
  directives: [NgIf, UploadCard, UploadingCard, UploadedCard, CopyInput],
)
class AppComponent {
  final UploaderService _uploaderService;
  final String idle = UploadStage.IDLE.toString();
  final String uploading = UploadStage.UPLOADING.toString();
  final String uploaded = UploadStage.UPLOADED.toString();

  String get uploadStage => _uploaderService.stage.toString();
  String get img => _uploaderService.uploadedImg;

  AppComponent(this._uploaderService);
}
