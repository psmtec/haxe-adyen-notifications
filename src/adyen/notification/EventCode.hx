package adyen.notification;

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
