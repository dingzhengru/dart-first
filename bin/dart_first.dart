import 'package:dart_first/dart_first.dart' as dart_first;
import 'dart:math';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

int squareNumber(int n) {
  return pow(n, 2);
}

class Post {
  Map<String, dynamic> _json;

  Post(this._json);

  int get userId => _json['userId'];
  int get id => _json['id'];
  String get title => _json['title'];
  String get body => _json['body'];

  Map<String, dynamic> toJson() => _json;

  factory Post.fromJson(Map<String, dynamic> _json) {
    return Post(_json);
  }
}

//* async
Future<List<Post>> fetchPostList() async {
  const url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(url);
  final responseJson = convert.jsonDecode(response.body);

  // print('Response status: ${response.statusCode}');
  // print('Response body: ${response.body}');
  // print(result);

  //* List.from 回傳 Iterable 型別
  final postList = List.from(responseJson).map((item) => Post(item)).toList();

  print(postList.length);
  print(postList[0].title);

  return postList;
}

void main(List<String> arguments) async {
  //* 更多宣告範例: https://medium.com/@lihsinplayer/dart%E5%85%A5%E9%96%80-3eb57099da48
  //* var
  var obj = {'x': 1};

  //* <type>
  String name = 'Voyager I';
  num numberA = 1977;
  int intergerA = 12;
  double doubleA = 123.123;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  //* const, final (皆不可再設值)  兩者差別可參考: https://stackoverflow.com/a/55990137/5134658
  //*   const: 需在 編譯 時就知道值為何(常數)
  //*   final: 需在 運行 時就知道值為何(可放計算後的值)

  const constA = 'const test';
  const num constB = 123;

  final finalA = squareNumber(5);
  final num finalB = squareNumber(10);

  print('Hello world: ${dart_first.calculate()}!');
  print('squareNumber: ${squareNumber(10)}');

  //* List
  final numberList = [1, 2, 3];
  numberList.forEach((item) => print(item));

  //* async
  await fetchPostList();
}
