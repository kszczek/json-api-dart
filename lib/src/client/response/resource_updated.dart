import 'package:json_api/document.dart';
import 'package:json_api/http.dart';

class ResourceUpdated {
  ResourceUpdated(this.http, Map? json) : resource = _resource(json) {
    if (json != null) {
      included.addAll(InboundDocument(json).included());
      meta.addAll(InboundDocument(json).meta());
      links.addAll(InboundDocument(json).links());
    }
  }

  static Resource? _resource(Map? json) {
    if (json != null) {
      final doc = InboundDocument(json);
      if (doc.hasData) {
        return doc.dataAsResource();
      }
    }
    return null;
  }

  final HttpResponse http;

  /// The created resource. Null for "204 No Content" responses.
  late final Resource? resource;

  /// Top-level meta data
  final meta = <String, Object?>{};

  /// Top-level links
  final links = <String, Link>{};

  /// Included resources
  final included = ResourceCollection();
}
