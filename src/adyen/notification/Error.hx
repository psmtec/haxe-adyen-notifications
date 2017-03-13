package adyen.notification;

// TODO (DK) use tink.TypedError?
typedef Error = {
	errorType: String,
	errorCode: String,
	message: String,
	status: String,
}
