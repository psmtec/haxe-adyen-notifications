package adyen.notification;

import tink.json.Representation;

// (DK) Adyen returns bools in JSON as string for whatever reason
abstract AdyenBool(Bool) {
	inline function new( v ) this = v;
	
	@:to function toRepresentation(): Representation<String>
		return new Representation('${this}');
		
	@:from static function ofRepresentation( rep: Representation<String> )
		return new AdyenBool(Tools.parseBool(rep.get()));
}

class Tools {
	public static inline function parseBool( s: String ) : Bool
		return s.toLowerCase() == "true";
}
