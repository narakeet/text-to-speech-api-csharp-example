using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.IO;
using System;
namespace NarakeetExample
{
  public class Program
  {    
    private const string voice = "charles";
    private const string DATA = "Hey there, from C Sharp";
    private const string RESULTFILE= "result.m4a";

    static async Task Main(string[] args)
    {
      if (args.Length < 1) {
        throw new ArgumentException("provide an API key as an argument");
      }
      
      HttpClient client = new HttpClient();
      HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, $"https://api.narakeet.com/text-to-speech/m4a?voice={voice}");
      client.DefaultRequestHeaders.Accept.Clear();
      client.DefaultRequestHeaders.Add("accept", "application/octet-stream");
      client.DefaultRequestHeaders.Add("x-api-key", args[0]);
      request.Content = new StringContent(DATA, Encoding.UTF8, "text/plain");
      using HttpResponseMessage response = await client.SendAsync(request);
      response.EnsureSuccessStatusCode();
      using (FileStream DestinationStream = File.Create(RESULTFILE))
      {
        await response.Content.CopyToAsync(DestinationStream);
      }
    }
  }
}
