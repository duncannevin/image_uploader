import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';

@Component(
  selector: 'drop-zone',
  templateUrl: 'drop_zone_component.html',
  styleUrls: ['drop_zone_component.css'],
  directives: [NgIf],
)
class DropZone {
  final _fileEvt = StreamController<File>();
  @Output()
  Stream<File> get file => _fileEvt.stream;

  @Input()
  String img = '';

  bool get preview => img.isNotEmpty;

  @HostListener('drop')
  void onDrop(MouseEvent evt) {
    evt.preventDefault();

    var files = evt.dataTransfer.files;

    if (files.length == 1) {
      _fileEvt.add(files[0]);
    }
  }

  @HostListener('dragover')
  void onDragover(Event evt) {
    evt.stopPropagation();
    evt.preventDefault();
  }
}
