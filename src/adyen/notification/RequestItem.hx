package adyen.notification;

import adyen.notification.Types;

// TODO (DK) i'd like a proper typedef better here, but for now this is how tink_json can parse it
enum RequestItem {
	NotificationRequestItem(
		?additionalData: AdditionalData,
		amount: Amount,
		eventCode: EventCode,
		eventDate: EventDate, // YYYY-MM-DDTHH:mm:ss.sssZ
		merchantAccountCode: MerchantAccountCode,
		merchantReference: MerchantReference,
		?operations: Array<Operation>, // (DK) only in authorisation notifications
		?originalReference: OriginalReference,
		?paymentMethod: PaymentMethod,  // (DK) only in authorisation notifications
		pspReference: PSPReference,
		?reason: Reason,
		success: AdyenBool
	);
}
