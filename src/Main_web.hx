import tink.http.containers.NodeContainer;
import tink.http.Handler;
import tink.http.Request;
import tink.http.Response;

using tink.CoreApi;

import adyen.Data;

class Main {
	public static function main() {
		var api = new Api();
		var port = Std.parseInt(untyped __js__('process.env.PORT'));
		var ip = untyped __js__('process.env.IP');
		trace('listening on ${ip}:${port}');
		
		var container = new NodeContainer(port);
		container.run(function( req ) return tink.Web.route(req, api));
	}
}

class Api {
	public function new() {
	}
	
	@:post('/')
	public function handlePayment( p ) : tink.Url {
		trace(p);
		return '/';
	}
}