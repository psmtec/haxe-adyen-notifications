package adyen.notification;

class Parser {
    var data: String;
    
    public function new( data: String )
        this.data = data;
        
    public function parse() : Notification
        return tink.Json.parse(data);
}
