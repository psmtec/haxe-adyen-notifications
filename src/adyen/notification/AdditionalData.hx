package adyen.notification;

abstract ShopperReference(String) from String to String { public inline function new( s ) this = s; }
abstract ShopperEmail(String) from String to String { public inline function new( s ) this = s; }
abstract ShopperIP(String) from String to String { public inline function new( s ) this = s; }
abstract AuthCode(String) from String to String { public inline function new( s ) this = s; }
abstract CardSummary(String) from String to String { public inline function new( s ) this = s; }
abstract CardExpiryDate(String) from String to String { public inline function new( s ) this = s; }
abstract AuthorisedAmountValue(String) from String to String { public inline function new( s ) this = s; }

typedef AdditionalData = {
	?shopperReference: ShopperReference, // TODO (DK) optional, but not optional in adyen docs
	?shopperEmail: ShopperEmail, // TODO (DK) optional, but not optional in adyen docs
	?shopperIP: ShopperIP, // TODO (DK) missing in adyen docs (notifications)
	?authCode: AuthCode,
	?cardSummary: CardSummary,
	?expiryDate: CardExpiryDate, // MM/YYYY
	?authorisedAmountValue: AuthorisedAmountValue,
	?authorisedAmountCurrency: Currency,
}
