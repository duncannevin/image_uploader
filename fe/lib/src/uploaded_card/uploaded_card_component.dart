import 'package:angular/angular.dart';
import 'package:fe/src/card/card_component.dart';
import 'package:fe/src/copy-input/copy_input_component.dart';
import 'package:fe/src/drop_zone/drop_zone_component.dart';

@Component(
  selector: 'uploaded-card',
  templateUrl: 'uploaded_card_component.html',
  styleUrls: ['uploaded_card_component.css'],
  directives: [DropZone, Card, CopyInput],
)
class UploadedCard {
  @Input()
  String img = '';
}
