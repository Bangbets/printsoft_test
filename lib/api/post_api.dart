// import 'package:http/http.dart' as http;

// class PostApi {
//   String? userName;
//   String? password;

//   PostApi({this.userName, this.password});

//   factory PostApi.fromJson(Map<String, dynamic> json) =>
//       PostApi(userName: json['username'], password: json['password']);

//   static Future<void> postData(String userName, String password) async {
//     try {
//       const urlPost = 'https://test.printsoft.co.id/api/login';

//       final response = await http.post(Uri.parse(urlPost),
//           body: ({
//             'username': userName,
//             'password': password,
//           }));
//       print(response.body);
//       // Navigator.push(context,
//       //     MaterialPageRoute(builder: (context) => const LoginSuccess()));
//     } catch (err) {}
//   }
// }
