From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 02/15] drm/mediatek: add connection from RDMA0 to DSI1
Date: Fri, 3 Aug 2018 12:58:53 +0800
Message-ID: <1533272333.31144.1.camel@mtksdaap41>
References: <1533265868-28110-1-git-send-email-stu.hsieh@mediatek.com>
 <1533265868-28110-3-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533265868-28110-3-git-send-email-stu.hsieh@mediatek.com>
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

SGksIFN0dToKCk9uIEZyaSwgMjAxOC0wOC0wMyBhdCAxMToxMCArMDgwMCwgU3R1IEhzaWVoIHdy
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIGNvbm5lY3Rpb24gZnJvbSBSRE1BMCB0byBEU0kxCj4gCj4g
U2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBp
bmRleCAwM2UzNjI4YjViMGQuLjMxMGQ4NDgyZDVhMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTEwNyw2ICsxMDcsNyBAQAo+ICAjZGVmaW5lIEdBTU1B
X01PVVRfRU5fUkRNQTEJCTB4MQo+ICAjZGVmaW5lIFJETUEwX1NPVVRfRFBJMAkJCTB4Mgo+ICAj
ZGVmaW5lIFJETUEwX1NPVVRfRFBJMQkJCTB4Mwo+ICsjZGVmaW5lIFJETUEwX1NPVVRfRFNJMQkJ
CTB4MQo+ICAjZGVmaW5lIFJETUEwX1NPVVRfRFNJMgkJCTB4NAo+ICAjZGVmaW5lIFJETUEwX1NP
VVRfRFNJMwkJCTB4NQo+ICAjZGVmaW5lIFJETUExX1NPVVRfRFBJMAkJCTB4Mgo+IEBAIC0yMjgs
NiArMjI5LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtf
ZGRwX2NvbXBfaWQgY3VyLAo+ICAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1B
MCAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFBJMSkgewo+ICAJCSphZGRyID0gRElTUF9SRUdf
Q09ORklHX0RJU1BfUkRNQTBfU09VVF9FTjsKPiAgCQl2YWx1ZSA9IFJETUEwX1NPVVRfRFBJMTsK
PiArCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTAgJiYgbmV4dCA9PSBERFBf
Q09NUE9ORU5UX0RTSTEpIHsKPiArCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JETUEw
X1NPVVRfRU47Cj4gKwkJdmFsdWUgPSBSRE1BMF9TT1VUX0RTSTE7Cj4gIAl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kyKSB7
Cj4gIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9TT1VUX0VOOwo+ICAJCXZh
bHVlID0gUkRNQTBfU09VVF9EU0kyOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
