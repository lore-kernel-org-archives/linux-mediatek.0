From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 4/4] drm/mediatek: add connection from OD1 to RDMA1
Date: Wed, 23 May 2018 14:01:18 +0800
Message-ID: <1527055278.21354.3.camel@mtksdaap41>
References: <20180523022517.12103-1-stu.hsieh@mediatek.com>
 <20180523022517.12103-5-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180523022517.12103-5-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Stu Hsieh <stu.hsieh@mediatek.com>
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIFN0dToKCk9uIFdlZCwgMjAxOC0wNS0yMyBhdCAxMDoyNSArMDgwMCwgU3R1IEhzaWVoIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIHRoZSBjb25uZWN0aW9uIGZyb20gT0QxIHRvIFJETUExIGZv
ciBleHQgcGF0aC4KPiAKCkkgd291bGQgbGlrZSB0byBhcHBseSB0aGlzIHBhdGNoIGJlZm9yZSB0
aGUgcGF0Y2ggJ0FkZCBzdXBwb3J0IGZvcgptZWRpYXRlayBTT0MgTVQyNzEyJyBiZWNhdXNlIHRo
aXMgcGF0Y2ggaXMgbmVjZXNzYXJ5IGZvciBtdDI3MTIuCgpSZWdhcmRzLApDSwoKPiBTaWduZWQt
b2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jIHwgMyArKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cC5jCj4gaW5kZXggM2M3YmQ0NTNjZjQyLi4wNDUwZWNiYmMzNTYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+IEBAIC0xOTMsNiArMTkzLDkgQEAgc3RhdGljIHVu
c2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAJ
fSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9HQU1NQSAmJiBuZXh0ID09IEREUF9DT01Q
T05FTlRfUkRNQTEpIHsKPiAgCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX0dBTU1BX01P
VVRfRU47Cj4gIAkJdmFsdWUgPSBHQU1NQV9NT1VUX0VOX1JETUExOwo+ICsJfSBlbHNlIGlmIChj
dXIgPT0gRERQX0NPTVBPTkVOVF9PRDEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX1JETUExKSB7
Cj4gKwkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9PRF9NT1VUX0VOOwo+ICsJCXZhbHVl
ID0gT0QxX01PVVRfRU5fUkRNQTE7Cj4gIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5U
X1JETUExICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7Cj4gIAkJKmFkZHIgPSBESVNQ
X1JFR19DT05GSUdfRElTUF9SRE1BMV9NT1VUX0VOOwo+ICAJCXZhbHVlID0gUkRNQTFfTU9VVF9E
UEkwOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
