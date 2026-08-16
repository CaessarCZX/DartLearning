void main() {
  print('Program started');

  final String url = 'https://github.io/request-hello';
  getHttp(url: url)
      .then((value) {
        print(value);
      })
      .catchError((error) {
        print('Error: $error');
      });

  print('Program finished');
}

/// Example of Future function
Future getHttp({required String url}) {
  return Future.delayed(const Duration(seconds: 2), () {
    //Error response
    throw 'Opps!. Something is wrong here';

    //Succesful response
    //     return 'Http response is here';
  });
}
