import ballerinax/googleapis.gmail as gmail;
import ballerina/log;

configurable OAuthConfigData oAuthConfigs = ?;

gmail:ConnectionConfig gmailConfig = {
        auth: {
            clientId: oAuthConfigs.clientId,
            clientSecret: oAuthConfigs.clientSecret,
            refreshUrl: gmail:REFRESH_URL,
            refreshToken: oAuthConfigs.refreshToken
        }
};
gmail:Client gmailClient = check new (gmailConfig);

public function sendEmail(string recipientEmail, string messageBody, string userName){
    gmail:MessageRequest messageRequest = {
    recipient : recipientEmail,
    sender : "akila.99g@gmail.com",
    subject : string `[Grama Sewa customer support] ${userName}`,
    messageBody : messageBody,
    contentType : gmail:TEXT_PLAIN
    };

    var sendMessageResponse = gmailClient->sendMessage(messageRequest);
    if (sendMessageResponse is gmail:Message) {
        log:printInfo("Sent Message ID: "+ sendMessageResponse.id);
        log:printInfo("Sent Thread ID: "+ sendMessageResponse.threadId);
    } else {
        log:printError("Error: ", sendMessageResponse);
    }
}