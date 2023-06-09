import ballerinax/trigger.slack;
import ballerina/http;
import ballerina/log;
import ballerina/regex;

configurable slack:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener slack:Listener webhookListener =  new(config,httpListener);

service slack:MessageService on webhookListener {
  
    remote function onMessage(slack:Message payload ) returns error? {
      log:printInfo("Message received onMessage" + payload.toBalString());
      json message = check payload.toJson().event.text;
      log:printInfo("Message : " + message.toString());
      string[] x = regex:split(message.toString(), "UserEmail: ");
      log:printInfo("Message : " + x.toString());
      string[] content = regex:split(x[1], "\n");
      string body = content[1]+"\n\n"+content[3];
      string userName = content[1].substring(3);
      sendEmail("dakshinaranmal1999@gmail.com" , body, userName);
    }
    remote function onMessageAppHome(slack:GenericEventWrapper payload ) returns error? {
      //Not Implemented
    }
    remote function onMessageChannels(slack:GenericEventWrapper payload ) returns error? {
      log:printInfo("Message received onMessageChannels" + payload.toBalString());
      //Not Implemented
    }
    remote function onMessageGroups(slack:GenericEventWrapper payload ) returns error? {
      //Not Implemented
    }
    remote function onMessageIm(slack:GenericEventWrapper payload ) returns error? {
      //Not Implemented
    }
    remote function onMessageMpim(slack:GenericEventWrapper payload ) returns error? {
      //Not Implemented
    }
}

service /ignore on httpListener {
    resource function post challenge(http:Caller caller, http:Request req) returns error?{
        http:Response res = new;
        json payload = check req.getJsonPayload();
        string challenge = check payload.challenge;
        log:printInfo("Challenge received" + challenge);
        res.setTextPayload(challenge);
        var result = caller->respond(res);
        if (result is error) {
            log:printError("Error sending response", err = result.toString());
        }
    }
}