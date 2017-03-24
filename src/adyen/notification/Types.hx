package adyen.notification;

import tink.json.Representation;

abstract EventDate(String) from String to String { public inline function new( s ) this = s; }
abstract MerchantAccountCode(String) from String to String { public inline function new( s ) this = s; }
abstract MerchantReference(String) from String to String { public inline function new( s ) this = s; }
abstract OriginalReference(String) from String to String { public inline function new( s ) this = s; }
abstract PaymentMethod(String) from String to String { public inline function new( s ) this = s; }
abstract PSPReference(String) from String to String { public inline function new( s ) this = s; }
abstract Reason(String) from String to String { public inline function new( s ) this = s; }

// (DK) Adyen returns bools in JSON as string for whatever reason
abstract AdyenBool(Bool) to Bool {
	inline function new( v ) this = v;

	@:to function toRepresentation()
		return new Representation('${this}');

	@:from static function ofRepresentation( rep: Representation<String> )
		return new AdyenBool(Tools.parseBool(rep.get()));
}

typedef CurrencyCode = iso4217.CurrencyCode;

private class Tools {
	public static inline function parseBool( s: String ) : Bool
		return s.toLowerCase() == "true";
}
