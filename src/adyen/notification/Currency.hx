package adyen.notification;

@:enum abstract Currency(String) from String to String {
    var EUR = 'EUR';
    var SEK = 'SEK';
}
