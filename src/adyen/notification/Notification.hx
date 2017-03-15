package adyen.notification;

import adyen.notification.Types;

typedef Notification = {
	live: AdyenBool,
	notificationItems: Array<RequestItem>,
}
