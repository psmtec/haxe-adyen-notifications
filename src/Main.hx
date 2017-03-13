import tink.http.containers.NodeContainer;
import tink.http.Handler;
import tink.http.Request;
import tink.http.Response;

using adyen.NotificationApi;
using tink.CoreApi;

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
						trace('---plain/success---');
						try {
							var adr: Notification = new Parser(body.toString()).parse();
							trace(adr);
						} catch (x: Dynamic) {
							trace('---oh noes: json parser error---');
							trace(x);
							trace('---/oh noes---');
						}
						trace('---/plain/success---');
					}
					case Failure(e):
						trace('---plain/failure---');
						trace(e);
						trace('---/plain/failure---');
				});
				// trace('plain');
				// trace(src);
			case Parsed(parts):
				trace('parsed');
				//trace(parts);
		}
		
		return Future.sync(OutgoingResponse.blob(haxe.io.Bytes.ofString(AcceptResponse.body), 'application/json'));
	}
}
