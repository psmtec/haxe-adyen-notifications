import tink.http.containers.NodeContainer;
import tink.http.Handler;
import tink.http.Request;
import tink.http.Response;

using tink.CoreApi;

import adyen.Data;

class Main {
	public static function main() {
		var port = Std.parseInt(untyped __js__('process.env.PORT'));
		var ip = untyped __js__('process.env.IP');
		trace('listening on ${ip}:${port}');
		
		var container = new NodeContainer(port);
		var handler = new SimpleHandler(handle);

		container.run(handler).handle(function( result ) {
			//trace(result);

			switch result {
				case Running(running):
				case Done:
				case Failed(e):
					trace(e);
			}
		});
	}

	static function handle( req: IncomingRequest ) : Future<OutgoingResponse> {
		switch (req.body) {
			case Plain(src):
				src.all().map(function( o ) return switch o {
					case Success(body): {
						trace('---success---');
						// trace(body.toString());
						var adr: adyen.Response = tink.Json.parse(body.toString());
						trace(adr);
						trace('---/success---');
					}
					case Failure(e):
						trace('---failure---');
						trace(e);
						trace('---/failure---');
				});
				// trace('plain');
				// trace(src);
			case Parsed(parts):
				trace('parsed');
				//trace(parts);
		}
		
		return Future.sync(OutgoingResponse.blob(haxe.io.Bytes.ofString('{"notificationResponse":"[accepted]"}'), 'application/json'));
	}
}
