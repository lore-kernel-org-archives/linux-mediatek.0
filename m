From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: Re: [PATCH v1 14/15] drm/mediatek: fixed the error value for add
 DSI1 in mutex
Date: Thu, 2 Aug 2018 19:39:09 +0800
Message-ID: <1533209949.11190.63.camel@mtksdccf07>
References: <1532420235-22268-1-git-send-email-stu.hsieh@mediatek.com>
 <1532420235-22268-15-git-send-email-stu.hsieh@mediatek.com>
 <1532495445.9280.22.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1532495445.9280.22.camel@mtksdaap41>
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

SGksIENLOgoKT24gV2VkLCAyMDE4LTA3LTI1IGF0IDEzOjEwICswODAwLCBDSyBIdSB3cm90ZToK
PiBIaSwgU3R1Ogo+IAo+IAo+IE9uIFR1ZSwgMjAxOC0wNy0yNCBhdCAxNjoxNyArMDgwMCwgU3R1
IEhzaWVoIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBmaXhlZCB0aGUgZXJyb3IgdmFsdWUgZm9yIGFk
ZCBEU0kxIGluIG11dGV4Cj4gPiAKPiAKPiBFbmdsaXNoIGlzIG5vdCBteSBtb3RoZXIgbGFuZ3Vh
Z2UsIGJ1dCBzaG91bGQgaXQgYmUgJ2ZpeCcgcmF0aGVyIHRoYW4KPiAnZml4ZWQnPwo+IAo+IFJl
Z2FyZHMsCj4gQ0sKPiAKT0sKClJlZ2FyZHMsClN0dQo+ID4gU2lnbmVkLW9mZi1ieTogU3R1IEhz
aWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jCj4gPiBpbmRleCAzMjM5ZjIyNzg1ZmQuLmFjMDQ3ZmRiMWEyYiAxMDA2NDQK
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCj4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwo+ID4gQEAgLTQzNyw3ICs0
MzcsNyBAQCB2b2lkIG10a19kaXNwX211dGV4X2FkZF9jb21wKHN0cnVjdCBtdGtfZGlzcF9tdXRl
eCAqbXV0ZXgsCj4gPiAgCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMDsKPiA+ICAJCWJyZWFrOwo+ID4g
IAljYXNlIEREUF9DT01QT05FTlRfRFNJMToKPiA+IC0JCXJlZyA9IE1VVEVYX1NPRl9EU0kwOwo+
ID4gKwkJcmVnID0gTVVURVhfU09GX0RTSTE7Cj4gPiAgCQlicmVhazsKPiA+ICAJY2FzZSBERFBf
Q09NUE9ORU5UX0RTSTI6Cj4gPiAgCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMjsKPiAKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
