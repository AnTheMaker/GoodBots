# GoodBots
Curated lists of IP addresses/whitelists of good bots and crawlers. Includes GoogleBot, BingBot, DuckDuckBot, etc.

All IP-Lists are in the [CIDR-Notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) and can be used as whitelists in your webserver's firewall or as an exception for rate-limits.

Either use the [all.ips](all.ips) list or a specific service's list of IP-Addresses found in the [iplists/](iplists/) directory.

The lists are updated daily via a scheduled GitHub Action.
<!-- TODO: Better Readme -->
  
```
.
├── all.ips 
│   Combined List of all IP addresses found in iplists/
│
└── iplists/
    │
    ├── ahrefsbot.ips
    │   IP-Addresses used by the AhrefsBot Crawler
    │   
    ├── applebot.ips
    │   Apple doesn't publish its "AppleBot" Crawler IPs, so this list includes all Apple IPs →TODO: Find better solution
    │   
    ├── betteruptimebot.ips
    │   IP-Addesses used by the BetterUptime Bot
    │   
    ├── bingbot.ips
    │   IP-Addesses used by the Bing Crawler
    │   
    ├── bunnycdn.ips
    │   IP-Addesses used by the bunny.net CDN
    │   
    ├── cloudflare.ips
    │   IP-Addesses used by the Cloudflare CDN
    │   
    ├── duckduckbot.ips
    │   IP-Addesses used by the DuckDuckGo Crawler
    │   
    ├── facebookbot.ips
    │   IP-Addesses used by the Facebook Link-Preview Bot
    │   
    ├── freshpingbot.ips
    │   IP-Addesses used by the Freshping Bot
    │   
    ├── googlebot.ips
    │   IP-Addesses used by the Google Crawler
    │   
    ├── imagekit.ips
    │   IP-Addesses used by the Imagekit.io Image Proxy
    │   
    ├── imgix.ips
    │   IP-Addesses used by the Imgix Image Proxy
    │   
    ├── internal.ips
    │   Internal IP-Addresses
    │   
    ├── mojeekbot.ips
    │   IP-Addesses used by the Mojeek Crawler
    │   
    ├── pingdombot.ips
    │   IP-Addesses used by the Pingdom Bot
    │   
    ├── rssapi.ips
    │   IP-Addesses used by the RSSAPI.net Feed parser
    │   
    ├── stripewebhook.ips
    │   IP-Addesses used by Stripe to send out Webhooks
    │   
    ├── telegrambot.ips
    │   IP-Addesses used by the Telegram Link-Preview Bot
    │   
    ├── twitterbot.ips
    │   IP-Addesses used by the Twitter Link-Preview Bot
    │
    ├── uptimerobot.ips
    │   IP-Addesses used by UptimeRobot.com
    │
    └── webpagetestbot.ips 
        IP-Addesses used by Webpagetest.org
        
```
