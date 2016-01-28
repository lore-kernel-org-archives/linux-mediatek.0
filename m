From: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
Subject: Re: MTK mt8173-evb: mainline unstable, and big-endian boot failures
Date: Thu, 28 Jan 2016 10:37:09 +0100
Message-ID: <1453973829.2217.0.camel@sipsolutions.net>
References: <CAOi56cVDbkAJEDWy3+DV63a=UuD7nqpUu8X7e-OjtWM-4dj_-w@mail.gmail.com>
 <CAF-23O2y7qRB=ZoU8cn2gcX7rjFdXh+rdLXSjF1nnym79Mknug@mail.gmail.com>
 (sfid-20160128_103122_810896_2EF40B14)
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <CAF-23O2y7qRB=ZoU8cn2gcX7rjFdXh+rdLXSjF1nnym79Mknug-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 (sfid-20160128_103122_810896_2EF40B14)
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Koan-Sin Tan <freedom.tan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?Q?=E9=99=B3=E6=9F=8F=E5=AE=8F?= <howard.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Pi-Cheng Chen <pi-cheng.chen-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

T24gVGh1LCAyMDE2LTAxLTI4IGF0IDE3OjMxICswODAwLCBLb2FuLVNpbiBUYW4gd3JvdGU6Cj7C
oAo+ID4gSSBoYXZlIHlldCB0byBkZWJ1ZyB0aGlzIGFueSBmdXJ0aGVyLCBidXQgc3RpbGwgd2Fu
dGVkIHRvIHJlcG9ydCBpdAo+ID4gaW4gY2FzZSBhbnlvbmUgZWxzZSBoYXMgdGhlIHRpbWUgdG8g
ZGVidWcgaXQgZnVydGhlci4KPiBiaXNlY3Qgc2hvd2VkIHRoYXQgdGhlIGN1bHByaXQgb2YgdGhl
IGJpZyBlbmRpYW4gcHJvYmxlbSBpcyBhCj4gInJlZ21hcC1tbWlvOiBVc2UgbmF0aXZlIGVuZGlh
bm5lc3MgZm9yIHJlYWQvd3JpdGUiCj4gcGF0Y2ggWzFdLiBJIHNhdyBKb2hhbm5lcyBhbHJlYWR5
IHByb3Bvc2VkIHRvIHJldmVydCBpdCBbMl0uCj4gCgpNYXJrIGhhcyByZWFsIGZpeGVzIGZvciBp
dCBpbnN0ZWFkOgpodHRwczovL2dpdC5rZXJuZWwub3JnL2NnaXQvbGludXgva2VybmVsL2dpdC9i
cm9vbmllL3JlZ21hcC5naXQvbG9nLz9oPWZpeC9tbWlvCgpqb2hhbm5lcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
