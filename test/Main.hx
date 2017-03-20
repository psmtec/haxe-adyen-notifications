using adyen.NotificationApi;

// TODO (DK) add proper tests? for now just see if tink_json can parse it
class Main {
    public static function main() {
        try {
            var n: Notification = tink.Json.parse('{}');
        } catch (x: Dynamic) {
        }
    }
}
