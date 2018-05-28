From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v1 6/7] drm/mediatek: add a error return value when
 clock driver has been prepared
Date: Mon, 28 May 2018 17:12:42 +0800
Message-ID: <1527498762.14913.6.camel@mtksdaap41>
References: <20180514075243.5442-1-bibby.hsieh@mediatek.com>
 <20180514075243.5442-7-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180514075243.5442-7-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIEJpYmJ5OgoKT24gTW9uLCAyMDE4LTA1LTE0IGF0IDE1OjUyICswODAwLCBCaWJieSBIc2ll
aCB3cm90ZToKPiBEUk0gZHJpdmVyIGdldCB0aGUgY29tcC0+Y2xrIGJ5IG9mX2Nsa19nZXQoKSwg
d2Ugb25seQo+IGFzc2lnbiBOVUxMIHRvIGNvbXAtPmNsayB3aGVuIGVycm9yIGhhcHBlbmVkLCBi
dXQgZG8KPiBub3QgcmV0dXJuIHRoZSBlcnJvciBudW1iZXIuCj4gCgpSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJp
YmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jCj4gaW5kZXggNDY3MjMxN2UzYWQxLi5kMzhhNTMwM2Y4ZmMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiBAQCAtMjgzLDcg
KzI4Myw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVj
dCBkZXZpY2Vfbm9kZSAqbm9kZSwKPiAgCWNvbXAtPmlycSA9IG9mX2lycV9nZXQobm9kZSwgMCk7
Cj4gIAljb21wLT5jbGsgPSBvZl9jbGtfZ2V0KG5vZGUsIDApOwo+ICAJaWYgKElTX0VSUihjb21w
LT5jbGspKQo+IC0JCWNvbXAtPmNsayA9IE5VTEw7Cj4gKwkJcmV0dXJuIFBUUl9FUlIoY29tcC0+
Y2xrKTsKPiAgCj4gIAkvKiBPbmx5IERNQSBjYXBhYmxlIGNvbXBvbmVudHMgbmVlZCB0aGUgTEFS
QiBwcm9wZXJ0eSAqLwo+ICAJY29tcC0+bGFyYl9kZXYgPSBOVUxMOwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
