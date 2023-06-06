import ballerinax/trigger.slack;
import ballerina/http;

configurable slack:ListenerConfig config = ?;

listener http:Listener httpListener = new(8090);
listener slack:Listener webhookListener =  new(config,httpListener);

service slack:MessageService on webhookListener {
  
    remote function onMessage(slack:Message payload ) returns error? {
      //Not Implemented
    }
    remote function onMessageAppHome(slack:GenericEventWrapper payload ) returns error? {
      //Not Implemented
    }
    remote function onMessageChannels(slack:GenericEventWrapper payload ) returns error? {
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

service /ignore on httpListener {}