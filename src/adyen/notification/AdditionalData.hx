package adyen.notification;

typedef AdditionalData = {
	?shopperReference: String, // TODO (DK) optional, but not optional in adyen docs
	?shopperEmail: String, // TODO (DK) optional, but not optional in adyen docs
	?shopperIP: String, // TODO (DK) missing in adyen docs (notifications)
	?authCode: String,
	?cardSummary: String,
	?expiryData: String, // MM/YYYY
	?authorisedAmountValue: String,
	?authorisedAmountCurrency: String,
}
