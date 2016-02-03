From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: MTK mt8173-evb: mainline unstable, and big-endian boot failures
Date: Tue, 2 Feb 2016 22:44:23 -0800
Message-ID: <CAOi56cUjbdRwd8qw+UFJGG_F0-a8yx12Uo0Ta_XF_wEZf8OgpQ@mail.gmail.com>
References: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w@mail.gmail.com>
 <7hsi1ilczm.fsf@baylibre.com>
 <CAF-23O3ps0Wt_UCmJbArpc5iJJryJKA0k_2qAyNb7op8O=UnAg@mail.gmail.com>
 <1453964180.26397.8.camel@mtksdaap41> <7hy4b8gc7q.fsf@baylibre.com>
 <1454309376.11974.3.camel@mtksdaap41> <7hh9hrgbbh.fsf@baylibre.com>
 <1454379462.27798.11.camel@mtksdaap41>
 <7h37tbdk6y.fsf@baylibre.com>
 <1454463498.27798.24.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1454463498.27798.24.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Fan Chen <fan.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Koan-Sin Tan <freedom.tan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?B?6Zmz5p+P5a6P?= <howard.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

SGkgRmFuLAoKT24gVHVlLCBGZWIgMiwgMjAxNiBhdCA1OjM4IFBNLCBGYW4gQ2hlbiA8ZmFuLmNo
ZW5AbWVkaWF0ZWsuY29tPiB3cm90ZToKCj4+IFNwZWFraW5nIG9mIHVwZGF0ZWQgZmlybXdhcmUs
IGlzIHRoZXJlIGFueSBjaGFuY2UgdG8gbWFrZSB0aGUgZGVmYXVsdAo+PiB2ZXJzaW9uIG9mIHRo
ZSBmaXJtd2FyZSBzaWduaWZpY2FudGx5IGxlc3Mgbm9pc3kuICBUaGVyZSBpcyBhIFRPTiBvZgo+
PiBvdXRwdXQgZnJvbSB0aGUgZmlybXdhcmUgYmVmb3JlIGZhc3Rib290IHN0YXJ0cyB3aGljaCBt
YWtlcyB0aGUgbG9ncyBmb3IKPj4gdGhpcyBib2FyZCB2ZXJ5IG5vaXN5IChzYW1lIGNvbXBsYWlu
dCBvbiB0aGUgbXQ4MTM1LikKPj4KPiBJIHdpbGwgZGlzY3VzcyB3aXRoIEVkZGllIGlmIGl0J3Mg
cG9zc2libGUgdG8gcmVsZWFzZSBhIHZlcnNpb24gd2l0aAo+IGxpZ2h0IGxvZ3MsIGJ1dCBJJ20g
YWZyYWlkIHRoZSBhbnN3ZXIgY291bGQgYmUgZ2l2ZW4gYWZ0ZXIgb3VyIENoaW5lc2UKPiBOZXcg
WWVhciB2YWNhdGlvbi4gOlAKClRoYW5rIHlvdSwgaXQncyBub3QgYSBiaWcgcnVzaCBvbiB0aGF0
IGZlYXR1cmUgcmVxdWVzdCwgYnV0IGl0IHdpbGwgYmUKaGVscGZ1bCB3aGVuZXZlciB5b3UgY2Fu
IGdldCB0byBpdC4gIFRoYW5rcyBmb3IgbG9va2luZyBpbnRvIGl0LiAgSQpob3BlIHlvdSBlbmpv
eSB5b3VyICB2YWNhdGlvbi4KCkd1w7JuacOhbiBox45vICA6KQoKS2V2aW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
