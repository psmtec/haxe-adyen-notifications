package adyen.notification;

@:enum abstract Operation(String) from String to String {
	var CANCEL = 'CANCEL';
	var CAPTURE = 'CAPTURE';
	var REFUND = 'REFUND';
}
