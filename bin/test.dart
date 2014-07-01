import "../lib/darttvdb.dart";

void main() {

	Tvdb db = new Tvdb("050AC25BEC637B32");
	
	Future series = db.getSeries("asd");
	series.then((ids){print(ids);});

}