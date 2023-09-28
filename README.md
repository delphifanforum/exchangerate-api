# Delphi ExchangeRate-API Client

A Delphi library to access the ExchangeRate-API and fetch exchange rates for different currencies.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Overview

This Delphi library provides a simple way to access the ExchangeRate-API and obtain exchange rates for a given base currency. The API allows you to fetch the latest exchange rates for various currencies.

## Features

- Fetch exchange rates for a specific base currency.
- Provides a Delphi interface to access the ExchangeRate-API easily.
- https://www.exchangerate-api.com/ (Free Api Key)

## Installation

To use this library, follow these steps:

1. Clone this repository or download the ZIP file.
2. Extract the contents to your desired location.
3. Add the `ExchangeRateAPIClient.pas` file to your Delphi project.

## Usage

Here's a simple example of how to use this library to fetch exchange rates for USD (U.S. Dollar):

```delphi
// Initialize the ExchangeRateAPI client with your API key
ExchangeRateClient := TExchangeRateAPIClient.Create('YOUR_API_KEY_HERE');

try
  // Fetch exchange rates for USD as the base currency
  ExchangeRates := ExchangeRateClient.GetExchangeRates('USD');

  // Display the exchange rates in the Memo or any UI element
  if Assigned(ExchangeRates) then
  begin
    // Parse and use the exchange rates as needed
    // For example:
    USDRate := ExchangeRates.Values['USD'].Value;
    Memo1.Lines.Add('EUR Exchange Rate: ' + USDRate);
    
    // Add more currencies and exchange rate fetching as needed

    ExchangeRates.Free;
  end
  else
    ShowMessage('Failed to fetch exchange rates.');

except
  on E: Exception do
    ShowMessage('Error: ' + E.Message);
end;

// Free the ExchangeRateAPI client when done
ExchangeRateClient.Free;
```
Replace 'YOUR_API_KEY_HERE' with your actual API key from ExchangeRate-API.

## License

This project is licensed under the MIT License.
