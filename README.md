# Narakeet Text to Speech Streaming API example in `C#`

This repository provides a quick example demonstrating how to access the Narakeet [streaming Text to Speech API](https://www.narakeet.com/docs/automating/text-to-speech-api/) from C# (.NET Core). 

The example sends a request to generate audio from text and saves it to result.m4a in the local directory.

## Prerequisites

This example works with .NET Core 6.0. You can run it inside Docker (then it does not require a local .NET Core installation), or on a system with a .NET Core 6.0 compatible installation.

## Running the example

Without Docker (replace `$API_KEY` with your api key):

```
dotnet publish -c Release
dotnet run --project NarakeetExample $API_KEY
```

On a system with Docker and GNU Makefile (replace `$API_KEY` with your api key):

```
make init
make execute API_KEY=$API_KEY
```


## More information

Check out <https://www.narakeet.com/docs/automating/text-to-speech-api/> for more information on the Narakeet Text to Speech API
