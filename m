From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/mediatek: Use ERR_CAST instead of ERR_PTR(PTR_ERR())
Date: Thu, 23 Nov 2017 10:31:44 +0100
Message-ID: <1511429504.7685.12.camel@pengutronix.de>
References: <1511303493-14897-1-git-send-email-gomonovych@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1511303493-14897-1-git-send-email-gomonovych@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Vasyl Gomonovych <gomonovych@gmail.com>, ck.hu@mediatek.com, airlied@linux.ie, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

T24gVHVlLCAyMDE3LTExLTIxIGF0IDIzOjMxICswMTAwLCBWYXN5bCBHb21vbm92eWNoIHdyb3Rl
Ogo+IFVzZSBFUlJfQ0FTVCBpbmxpbmVkIGZ1bmN0aW9uIGluc3RlYWQgb2YgRVJSX1BUUihQVFJf
RVJSKC4uLikpLgo+IAo+IGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jOjIy
Mzo5LTE2OiBXQVJOSU5HOiBFUlJfQ0FTVCBjYW4gYmUgdXNlZCB3aXRoIG10a19nZW0KPiBHZW5l
cmF0ZWQgYnk6IHNjcmlwdHMvY29jY2luZWxsZS9hcGkvZXJyX2Nhc3QuY29jY2kKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBWYXN5bCBHb21vbm92eWNoIDxnb21vbm92eWNoQGdtYWlsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHJtX2dlbS5jCj4gaW5kZXggZjU5NWFjODE2YjU1Li41NzY2YjQyZmMx
NzQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZ2VtLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9nZW0uYwo+IEBAIC0yMjAs
NyArMjIwLDcgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICptdGtfZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICAJbXRrX2dlbSA9IG10a19kcm1fZ2Vt
X2luaXQoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSk7Cj4gIAo+ICAJaWYgKElTX0VSUihtdGtf
Z2VtKSkKPiAtCQlyZXR1cm4gRVJSX1BUUihQVFJfRVJSKG10a19nZW0pKTsKPiArCQlyZXR1cm4g
RVJSX0NBU1QobXRrX2dlbSkpOwo+ICAKPiAgCWV4cGVjdGVkID0gc2dfZG1hX2FkZHJlc3Moc2ct
PnNnbCk7Cj4gIAlmb3JfZWFjaF9zZyhzZy0+c2dsLCBzLCBzZy0+bmVudHMsIGkpIHsKCkFja2Vk
LWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGls
aXBwCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
