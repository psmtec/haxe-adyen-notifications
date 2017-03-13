package adyen.notification;

import adyen.notification.Tools;

typedef Notification = {
	live: AdyenBool,
	notificationItems: Array<RequestItem>,
}
