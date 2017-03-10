package adyen;

typedef Error = {
	errorType: String,
	errorCode: String,
	message: String,
	status: String,
}

typedef AdditionalData = {
	shopperReference: String,
	shopperEmail: String,
	?authCode: String,
	?cardSummary: String,
	?expiryData: String, // MM/YYYY
	?authorisedAmountValue: String,
	?authorisedAmountCurrency: String,
}

typedef Amount = {
	currency: String, // https://en.wikipedia.org/wiki/ISO_4217
	value: Int,
}

@:enum abstract EventCode(String) from String to String {
	var AUTHORISATION = 'AUTHORISATION';
	
	// modification events
	var CANCELLATION = 'CANCELLATION';
	var REFUND = 'REFUND';
	var CANCEL_OR_REFUND = 'CANCEL_OR_REFUND';
	var CAPTURE = 'CAPTURE';
	var CAPTURE_FAILED = 'CAPTURE_FAILED';
	var REFUND_FAILED = 'REFUND_FAILED';
	var REFUNDED_REVERSED  = 'REFUNDED_REVERSED ';
	var PAIDOUT_REVERSED = 'PAIDOUT_REVERSED ';
	
	// dispute events
	var REQUEST_FOR_INFORMATION = 'REQUEST_FOR_INFORMATION';
	var CHARGEBACK = 'CHARGEBACK';
	var CHARGEBACK_REVERSED = 'CHARGEBACK_REVERSED';
	var NOTIFICATION_OF_CHARGEBACK = 'NOTIFICATION_OF_CHARGEBACK';
	var NOTIFICATION_OF_FRAUD = 'NOTIFICATION_OF_FRAUD';
	
	// manual review events
	var MANUAL_REVIEW_ACCEPT = 'MANUAL_REVIEW_ACCEPT';
	var MANUAL_REVIEW_REJECT = 'MANUAL_REVIEW_REJECT';
	
	// recurring events
	var RECURRING_CONTRACT = 'RECURRING_CONTRACT';
	
	// payout events
	var PAYOUT_EXPIRE = 'PAYOUT_EXPIRE';
	var PAYOUT_DECLINE = 'PAYOUT_DECLINE';
	var PAYOUT_THIRDPARTY = 'PAYOUT_THIRDPARTY';
	var REFUND_WITH_DATA = 'REFUND_WITH_DATA';
	
	// other
	var AUTHORISE_REFERRAL = 'AUTHORISE_REFERRAL';
	var EXPIRE = 'EXPIRE';
	var FRAUD_ONLY = 'FRAUD_ONLY';
	var FUND_TRANSFER = 'FUND_TRANSFER';
	var HANDLED_EXTERNALLY = 'HANDLED_EXTERNALLY';
	var OFFER_CLOSED = 'OFFER_CLOSED';
	var ORDER_OPENED = 'ORDER_OPENED';
	var ORDER_CLOSED = 'ORDER_CLOSED';
	var PENDING = 'PENDING';
	var PROCESS_RETRY = 'PROCESS_RETRY';
	var REPORT_AVAILABLE = 'REPORT_AVAILABLE';
}

@:enum abstract Operation(String) from String to String {
	var CANCEL = 'CANCEL';
	var CAPTURE = 'CAPTURE';
	var REFUND = 'REFUND';
}

enum RequestItem {
	NotificationRequestItem(
		?additionalData: AdditionalData,
		amount: Amount,
		eventCode: EventCode,
		eventDate: String, // YYYY-MM-DDTHH:mm:ss.sssZ
		merchantAccountCode: String,
		merchantReference: String,
		?operations: Array<Operation>, // (DK) only in authorisation notifications
		?originalReference: String,
		?paymentMethod: String,  // (DK) only in authorisation notifications
		pspReference: String,
		?reason: String,
		success: String // TODO (DK) should be Bool
	);
}

// typedef NotificationRequestItem = {
// 	additionalData: AdditionalData,
// 	amount: Amount,
// 	pspReference: String,
// 	eventCode: EventCode,
// 	eventDate: String, // YYYY-MM-DDTHH:mm:ss.sssZ
// 	merchantAccountCode: String,
// 	operations: Array<Operation>,
// 	merchantReference: String,
// 	originalReference: String,
// 	paymentMethod: String,
// 	reason: String,
// 	success: Bool,
// }

typedef Response = {
	live: String, // Bool, // TODO (DK) notify adyen this is a string, not a bool
	notificationItems: Array<RequestItem>,
}
