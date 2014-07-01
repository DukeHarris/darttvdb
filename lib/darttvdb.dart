library darttvdb;

import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'package:xml2json/xml2json.dart';

class Tvdb {
	
	String _apiKey;
	String _apiUrl = "http://thetvdb.com";

	Tvdb(this._apiKey);

	get apiKey => _apiKey;


	Future getSeries(String searchString){

		String url = this._apiUrl + "/api/GetSeries.php?seriesname=weeds";
		print(url);

		return new HttpClient().getUrl(Uri.parse(url))
    		.then((HttpClientRequest request) => request.close())
    		.then((HttpClientResponse response) {
    			Stream stream = response.transform(new Utf8Decoder());
    			return stream.first;
    		})
    		.then((xmlString){
    			
				Xml2Json jsonTransform = new Xml2Json();
				jsonTransform.parse(xmlString);
				var json = JSON.decode(jsonTransform.toParker());

    			return json["Data"];
    		});
	}
}
