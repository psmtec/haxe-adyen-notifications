package adyen.notification;

import adyen.notification.Tools;

// TODO (DK) i'd like a proper typedef better here, but for now this is how tink_json can parse it
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
		success: AdyenBool
	);
}
