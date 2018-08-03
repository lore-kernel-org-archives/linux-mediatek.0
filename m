From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v2 01/15] drm/mediatek: add connection from RDMA0 to DPI1
Date: Fri, 3 Aug 2018 12:57:52 +0800
Message-ID: <1533272272.31144.0.camel@mtksdaap41>
References: <1533265868-28110-1-git-send-email-stu.hsieh@mediatek.com>
 <1533265868-28110-2-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533265868-28110-2-git-send-email-stu.hsieh@mediatek.com>
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
b3RlOgo+IFRoaXMgcGF0Y2ggYWRkIGNvbm5lY3Rpb24gZnJvbSBSRE1BMCB0byBEUEkxCj4gCj4g
U2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgoKUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKPiBp
bmRleCA4N2U0MTkxYzI1MGUuLjAzZTM2MjhiNWIwZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCj4gQEAgLTEwNiw2ICsxMDYsNyBAQAo+ICAjZGVmaW5lIE9WTDFf
TU9VVF9FTl9DT0xPUjEJCTB4MQo+ICAjZGVmaW5lIEdBTU1BX01PVVRfRU5fUkRNQTEJCTB4MQo+
ICAjZGVmaW5lIFJETUEwX1NPVVRfRFBJMAkJCTB4Mgo+ICsjZGVmaW5lIFJETUEwX1NPVVRfRFBJ
MQkJCTB4Mwo+ICAjZGVmaW5lIFJETUEwX1NPVVRfRFNJMgkJCTB4NAo+ICAjZGVmaW5lIFJETUEw
X1NPVVRfRFNJMwkJCTB4NQo+ICAjZGVmaW5lIFJETUExX1NPVVRfRFBJMAkJCTB4Mgo+IEBAIC0y
MjQsNiArMjI1LDkgQEAgc3RhdGljIHVuc2lnbmVkIGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBt
dGtfZGRwX2NvbXBfaWQgY3VyLAo+ICAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9S
RE1BMCAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFBJMCkgewo+ICAJCSphZGRyID0gRElTUF9S
RUdfQ09ORklHX0RJU1BfUkRNQTBfU09VVF9FTjsKPiAgCQl2YWx1ZSA9IFJETUEwX1NPVVRfRFBJ
MDsKPiArCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTAgJiYgbmV4dCA9PSBE
RFBfQ09NUE9ORU5UX0RQSTEpIHsKPiArCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JE
TUEwX1NPVVRfRU47Cj4gKwkJdmFsdWUgPSBSRE1BMF9TT1VUX0RQSTE7Cj4gIAl9IGVsc2UgaWYg
KGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0ky
KSB7Cj4gIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9TT1VUX0VOOwo+ICAJ
CXZhbHVlID0gUkRNQTBfU09VVF9EU0kyOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
