import 'dart:convert';

import 'package:json_api/http.dart';

final collectionMin = HttpResponse(200,
    body: jsonEncode({
      'data': [
        {'type': 'articles', 'id': '1'}
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final collectionFull = HttpResponse(200,
    body: jsonEncode({
      'links': {
        'self': 'http://example.com/articles',
        'next': 'http://example.com/articles?page[offset]=2',
        'last': 'http://example.com/articles?page[offset]=10'
      },
      'meta': {'hello': 'world'},
      'data': [
        {
          'type': 'articles',
          'id': '1',
          'attributes': {'title': 'JSON:API paints my bikeshed!'},
          'relationships': {
            'author': {
              'links': {
                'self': 'http://example.com/articles/1/relationships/author',
                'related': 'http://example.com/articles/1/author'
              },
              'data': {'type': 'people', 'id': '9'}
            },
            'comments': {
              'links': {
                'self': 'http://example.com/articles/1/relationships/comments',
                'related': 'http://example.com/articles/1/comments'
              },
              'data': [
                {'type': 'comments', 'id': '5'},
                {'type': 'comments', 'id': '12'}
              ]
            }
          },
          'links': {'self': 'http://example.com/articles/1'}
        }
      ],
      'included': [
        {
          'type': 'people',
          'id': '9',
          'attributes': {
            'firstName': 'Dan',
            'lastName': 'Gebhardt',
            'twitter': 'dgeb'
          },
          'links': {'self': 'http://example.com/people/9'}
        },
        {
          'type': 'comments',
          'id': '5',
          'attributes': {'body': 'First!'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '2'}
            }
          },
          'links': {'self': 'http://example.com/comments/5'}
        },
        {
          'type': 'comments',
          'id': '12',
          'attributes': {'body': 'I like XML better'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '9'}
            }
          },
          'links': {'self': 'http://example.com/comments/12'}
        }
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final primaryResource = HttpResponse(200,
    body: jsonEncode({
      'links': {'self': 'http://example.com/articles/1'},
      'meta': {'hello': 'world'},
      'data': {
        'type': 'articles',
        'id': '1',
        'attributes': {'title': 'JSON:API paints my bikeshed!'},
        'relationships': {
          'author': {
            'links': {'related': 'http://example.com/articles/1/author'}
          }
        }
      },
      'included': [
        {
          'type': 'people',
          'id': '9',
          'attributes': {
            'firstName': 'Dan',
            'lastName': 'Gebhardt',
            'twitter': 'dgeb'
          },
          'links': {'self': 'http://example.com/people/9'}
        },
        {
          'type': 'comments',
          'id': '5',
          'attributes': {'body': 'First!'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '2'}
            }
          },
          'links': {'self': 'http://example.com/comments/5'}
        },
        {
          'type': 'comments',
          'id': '12',
          'attributes': {'body': 'I like XML better'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '9'}
            }
          },
          'links': {'self': 'http://example.com/comments/12'}
        }
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});
final relatedResourceNull = HttpResponse(200,
    body: jsonEncode({
      'links': {'self': 'http://example.com/articles/1/author'},
      'meta': {'hello': 'world'},
      'data': null
    }))
  ..headers.addAll({'Content-Type': mediaType});
final one = HttpResponse(200,
    body: jsonEncode({
      'links': {
        'self': '/articles/1/relationships/author',
        'related': '/articles/1/author'
      },
      'meta': {'hello': 'world'},
      'data': {'type': 'people', 'id': '12'},
      'included': [
        {
          'type': 'people',
          'id': '9',
          'attributes': {
            'firstName': 'Dan',
            'lastName': 'Gebhardt',
            'twitter': 'dgeb'
          },
          'links': {'self': 'http://example.com/people/9'}
        },
        {
          'type': 'comments',
          'id': '5',
          'attributes': {'body': 'First!'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '2'}
            }
          },
          'links': {'self': 'http://example.com/comments/5'}
        },
        {
          'type': 'comments',
          'id': '12',
          'attributes': {'body': 'I like XML better'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '9'}
            }
          },
          'links': {'self': 'http://example.com/comments/12'}
        }
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final oneEmpty = HttpResponse(200,
    body: jsonEncode({
      'links': {
        'self': '/articles/1/relationships/author',
        'related': '/articles/1/author'
      },
      'meta': {'hello': 'world'},
      'data': null,
      'included': [
        {
          'type': 'people',
          'id': '9',
          'attributes': {
            'firstName': 'Dan',
            'lastName': 'Gebhardt',
            'twitter': 'dgeb'
          },
          'links': {'self': 'http://example.com/people/9'}
        },
        {
          'type': 'comments',
          'id': '5',
          'attributes': {'body': 'First!'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '2'}
            }
          },
          'links': {'self': 'http://example.com/comments/5'}
        },
        {
          'type': 'comments',
          'id': '12',
          'attributes': {'body': 'I like XML better'},
          'relationships': {
            'author': {
              'data': {'type': 'people', 'id': '9'}
            }
          },
          'links': {'self': 'http://example.com/comments/12'}
        }
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final many = HttpResponse(200,
    body: jsonEncode({
      'links': {
        'self': '/articles/1/relationships/tags',
        'related': '/articles/1/tags'
      },
      'meta': {'hello': 'world'},
      'data': [
        {'type': 'tags', 'id': '12'}
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final noContent = HttpResponse(204);

final error422 = HttpResponse(422,
    body: jsonEncode({
      'meta': {'hello': 'world'},
      'errors': [
        {
          'status': '422',
          'source': {'pointer': '/data/attributes/firstName'},
          'title': 'Invalid Attribute',
          'detail': 'First name must contain at least three characters.'
        }
      ]
    }))
  ..headers.addAll({'Content-Type': mediaType});

final error500 = HttpResponse(500);
