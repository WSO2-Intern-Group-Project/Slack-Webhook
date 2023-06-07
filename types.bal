# OAuth Credentials 
# 
# + clientId - OAuth Client ID
# + clientSecret - OAuth Client Secret  
# + refreshToken - Refresh Token 
# + accessToken - Access Token 
public type OAuthConfigData record {|
    string clientId;
    string clientSecret;
    string refreshToken;
    string accessToken;
|};

# Spreadhseet Configuration
# 
# + spreadsheetUrl - URL to the spreadsheet  
# + sheetName - worksheet name
# + tableHeaders - Headers of the worksheet
public type SpreadsheetConfigData record {|
    string spreadsheetUrl;
    string sheetName;
    string[] tableHeaders;
|};
