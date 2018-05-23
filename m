From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: Re: [PATCH v2 4/4] drm/mediatek: add connection from OD1 to RDMA1
Date: Wed, 23 May 2018 17:31:09 +0800
Message-ID: <1527067869.19074.29.camel@mtksdaap41>
References: <20180523022517.12103-1-stu.hsieh@mediatek.com>
 <20180523022517.12103-5-stu.hsieh@mediatek.com>
 <1527055278.21354.3.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1527055278.21354.3.camel@mtksdaap41>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIENLOgoKT24gV2VkLCAyMDE4LTA1LTIzIGF0IDE0OjAxICswODAwLCBDSyBIdSB3cm90ZToK
PiBIaSwgU3R1Ogo+IAo+IE9uIFdlZCwgMjAxOC0wNS0yMyBhdCAxMDoyNSArMDgwMCwgU3R1IEhz
aWVoIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBhZGQgdGhlIGNvbm5lY3Rpb24gZnJvbSBPRDEgdG8g
UkRNQTEgZm9yIGV4dCBwYXRoLgo+ID4gCj4gCj4gSSB3b3VsZCBsaWtlIHRvIGFwcGx5IHRoaXMg
cGF0Y2ggYmVmb3JlIHRoZSBwYXRjaCAnQWRkIHN1cHBvcnQgZm9yCj4gbWVkaWF0ZWsgU09DIE1U
MjcxMicgYmVjYXVzZSB0aGlzIHBhdGNoIGlzIG5lY2Vzc2FyeSBmb3IgbXQyNzEyLgpvawoKPiAK
PiBSZWdhcmRzLAo+IENLCj4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2ll
aEBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHAuYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ID4gaW5kZXggM2M3
YmQ0NTNjZjQyLi4wNDUwZWNiYmMzNTYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwLmMKPiA+IEBAIC0xOTMsNiArMTkzLDkgQEAgc3RhdGljIHVuc2lnbmVkIGlu
dCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAo+ID4gIAl9IGVsc2Ug
aWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX0dBTU1BICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9S
RE1BMSkgewo+ID4gIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9HQU1NQV9NT1VUX0VO
Owo+ID4gIAkJdmFsdWUgPSBHQU1NQV9NT1VUX0VOX1JETUExOwo+ID4gKwl9IGVsc2UgaWYgKGN1
ciA9PSBERFBfQ09NUE9ORU5UX09EMSAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfUkRNQTEpIHsK
PiA+ICsJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RJU1BfT0RfTU9VVF9FTjsKPiA+ICsJCXZh
bHVlID0gT0QxX01PVVRfRU5fUkRNQTE7Cj4gPiAgCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01Q
T05FTlRfUkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQSTApIHsKPiA+ICAJCSphZGRy
ID0gRElTUF9SRUdfQ09ORklHX0RJU1BfUkRNQTFfTU9VVF9FTjsKPiA+ICAJCXZhbHVlID0gUkRN
QTFfTU9VVF9EUEkwOwo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
