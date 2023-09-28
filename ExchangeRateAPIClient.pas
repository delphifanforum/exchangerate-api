unit ExchangeRateAPIClient;

interface

uses
  System.SysUtils, System.Classes, System.Net.HttpClientComponent, System.JSON;

type
  TExchangeRateAPIClient = class
  private
    FHttpClient: TNetHTTPClient;
    FApiKey: string;
  public
    constructor Create(const ApiKey: string);
    destructor Destroy; override;

    function GetExchangeRates(const baseCurrency: string): TJSONObject;
  end;

implementation

{ TExchangeRateAPIClient }

constructor TExchangeRateAPIClient.Create(const ApiKey: string);
begin
  FHttpClient := TNetHTTPClient.Create(nil);
  FApiKey := ApiKey;
end;

destructor TExchangeRateAPIClient.Destroy;
begin
  FHttpClient.Free;
  inherited;
end;

function TExchangeRateAPIClient.GetExchangeRates(const baseCurrency: string): TJSONObject;
var
  ResponseContent: string;
begin
  Result := nil;
  try
    ResponseContent := FHttpClient.Get(
      Format('https://v6.exchangerate-api.com/v6/%s/latest/%s', [FApiKey, baseCurrency])
    );

    Result := TJSONObject.ParseJSONValue(ResponseContent) as TJSONObject;
  except
    on E: Exception do
    begin
      // Handle any exceptions or errors here
      // You may want to log the error or display a message to the user
    end;
  end;
end;

end.
