void main() async {
  print('Program started');
  final String url = 'https://github.io/request-hello';

  try {
    final res = await getHttp(url: url);
    print(res);
  } catch (err) {
    print('Error: $err');
  } finally {
    print('Program finished');
  }
}

/// Example of Future function with async-await
// Async allways await for a 'Future'/'Void' return
Future<String> getHttp({required String url}) async {
  await Future.delayed(const Duration(seconds: 2));
  //Error response
  //   throw 'Opps!. Something is wrong here';
  //Successful response
  return 'Normalized Http response';
}
