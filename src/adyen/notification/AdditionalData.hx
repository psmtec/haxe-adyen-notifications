package adyen.notification;

import adyen.notification.Types;

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
	?authorisedAmountCurrency: CurrencyCode,

	?eci: String, // "N/A"
	?xid: String, // "AAE="
	?cavv: String, // "AAE="
	?cavvAlgorithm: String, // "N/A"
	?cardBin: String, // "976543"

	?totalFraudScore: String, // "10"

	?extraCostsValue: String, // "202"
	?extraCostsCurrency: CurrencyCode, // "GBP"

	?cardHolderName: String, // "J. De Tester"
	// "billingAddress.street": String, // "Nieuwezijds Voorburgwal"
	// "billingAddress.houseNumberOrName": String, // "21 - 5"
	// "billingAddress.postalCode": String, // "1012RC"
	// "billingAddress.city": String, // "Amsterdam"
	// "billingAddress.country": String, // "NL"
	?issuerCountry: String, // "unknown"

	?threeDAuthenticated: AdyenBool,
	?threeDOffered: AdyenBool,
	?threeDOfferedResponse: String, // "N/A"
	?threeDAuthenticatedResponse: String, // "N/A"

	?aliasType: String, // "Default"
	?alias: String, // "H934380689410347"

	?paymentMethodVariant: String, // "visa"

	// "fraudCheck-6-ShopperIpUsage": String, // "10"
	// " NAME 1": String, // "VALUE1"
	// "NAME2": String, // " VALUE2  "

	?deviceType: String, // "Other"
	?browserCode: String, // "Other"
}
