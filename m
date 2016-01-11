From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] mfd: mt6397: convert to arch_initcall
Date: Mon, 11 Jan 2016 05:49:32 +0000
Message-ID: <20160111054932.GH3331@x1>
References: <1450862711-22124-1-git-send-email-henryc.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450862711-22124-1-git-send-email-henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Flora Fu <flora.fu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

T24gV2VkLCAyMyBEZWMgMjAxNSwgSGVucnkgQ2hlbiB3cm90ZToKCj4gU2luY2UgcGluY3RybCBv
ciByZWd1bGF0b3Igb2YgbXQ2Mzk2IG5lZWQgdG8gaW5pdGlhbGl6ZSBlYXJsaWVyIHRvIGF2b2lk
Cj4gcHJvYmUgZGVmZXJyaW5nLCBhbHNvIGNoYW5nZSB0aGUgY29yZSBkcml2ZXIgdG8gYXJjaF9p
bml0LgoKVGhpcyBpcyBleGFjdGx5IHdoYXQgZGVmZXJyaW5nIHByb2JlIHdhcyBkZXNpZ25lZCBm
b3I7IHNvIHRoYXQgeW91CmRvbid0IGhhdmUgdG8gbWVzcyBhcm91bmQgd2l0aCBpbml0Y2FsbCBv
cmRlcmluZy4KCj4gU2lnbmVkLW9mZi1ieTogSGVucnkgQ2hlbiA8aGVucnljLmNoZW5AbWVkaWF0
ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIHwgNiArKysrKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21mZC9tdDYzOTctY29yZS5jIGIvZHJpdmVycy9tZmQvbXQ2Mzk3LWNv
cmUuYwo+IGluZGV4IDE3NDljMWMuLmFmOThiNGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQv
bXQ2Mzk3LWNvcmUuYwo+ICsrKyBiL2RyaXZlcnMvbWZkL210NjM5Ny1jb3JlLmMKPiBAQCAtMjg1
LDcgKzI4NSwxMSBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdDYzOTdfZHJpdmVy
ID0gewo+ICAJfSwKPiAgfTsKPiAgCj4gLW1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIobXQ2Mzk3X2Ry
aXZlcik7Cj4gK3N0YXRpYyBpbnQgX19pbml0IG10NjM5N19jb3JlX2luaXQodm9pZCkKPiArewo+
ICsJcmV0dXJuIHBsYXRmb3JtX2RyaXZlcl9yZWdpc3RlcigmbXQ2Mzk3X2RyaXZlcik7Cj4gK30K
PiArYXJjaF9pbml0Y2FsbChtdDYzOTdfY29yZV9pbml0KTsKPiAgCj4gIE1PRFVMRV9BVVRIT1Io
IkZsb3JhIEZ1LCBNZWRpYVRlayIpOwo+ICBNT0RVTEVfREVTQ1JJUFRJT04oIkRyaXZlciBmb3Ig
TWVkaWFUZWsgTVQ2Mzk3IFBNSUMiKTsKCi0tIApMZWUgSm9uZXMKTGluYXJvIFNUTWljcm9lbGVj
dHJvbmljcyBMYW5kaW5nIFRlYW0gTGVhZApMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0
d2FyZSBmb3IgQVJNIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxv
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
