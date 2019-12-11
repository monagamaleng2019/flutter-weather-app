import 'package:http/http.dart' as http;

wethearApi(int cityId)async {
  var appid= "5f3d5a06448c920dd5a33de3709dd1bf";

  var url =
      'https://api.openweathermap.org/data/2.5/weather?q=($cityId)&APPID=($appid)';
  var header = {
    "x-rapidapi-host": "community-open-weather-map.p.rapidapi.com",
    "x-rapidapi-key": "5f3d5a06448c920dd5a33de3709dd1bf"
  };

final response = await http.get(url, headers: header);
  
response.statusCode == 200
? handelSuccessfulResponse()
: handelFailedRespose() ; 
}

handelSuccessfulResponse(){}

handelFailedRespose(){}