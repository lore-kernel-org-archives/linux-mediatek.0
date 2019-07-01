From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v4 4/4] drm/mtk: add panel orientation
 property
Date: Mon, 1 Jul 2019 09:59:19 +0800
Message-ID: <1561946359.23228.0.camel@mtksdaap41>
References: <20190622034105.188454-1-dbasehore@chromium.org>
 <20190622034105.188454-5-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190622034105.188454-5-dbasehore@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Derek Basehore <dbasehore@chromium.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIERlcmVrOgoKT24gRnJpLCAyMDE5LTA2LTIxIGF0IDIwOjQxIC0wNzAwLCBEZXJlayBCYXNl
aG9yZSB3cm90ZToKPiBUaGlzIGluaXRzIHRoZSBwYW5lbCBvcmllbnRhdGlvbiBwcm9wZXJ0eSBm
b3IgdGhlIG1lZGlhdGVrIGRzaSBkcml2ZXIKPiBpZiB0aGUgcGFuZWwgb3JpZW50YXRpb24gKGNv
bm5lY3Rvci5kaXNwbGF5X2luZm8ucGFuZWxfb3JpZW50YXRpb24pIGlzCj4gbm90IERSTV9NT0RF
X1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04uCj4gCgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4KCj4gU2lnbmVkLW9mZi1ieTogRGVyZWsgQmFzZWhvcmUgPGRiYXNlaG9y
ZUBjaHJvbWl1bS5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKPiBpbmRleCA0YTBiOTE1MGE3YmIuLjA4ZmZkYzc1
MjZkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC03ODIsMTAgKzc4
MiwxOCBAQCBzdGF0aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQo+ICAJCQlEUk1fRVJST1IoIkZhaWxlZCB0
byBhdHRhY2ggcGFuZWwgdG8gZHJtXG4iKTsKPiAgCQkJZ290byBlcnJfY29ubmVjdG9yX2NsZWFu
dXA7Cj4gIAkJfQo+ICsKPiArCQlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXRfcGFuZWxfb3JpZW50
YXRpb25fcHJvcGVydHkoJmRzaS0+Y29ubik7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQlEUk1fRVJS
T1IoIkZhaWxlZCB0byBpbml0IHBhbmVsIG9yaWVudGF0aW9uXG4iKTsKPiArCQkJZ290byBlcnJf
cGFuZWxfZGV0YWNoOwo+ICsJCX0KPiAgCX0KPiAgCj4gIAlyZXR1cm4gMDsKPiAgCj4gK2Vycl9w
YW5lbF9kZXRhY2g6Cj4gKwlkcm1fcGFuZWxfZGV0YWNoKGRzaS0+cGFuZWwpOwo+ICBlcnJfY29u
bmVjdG9yX2NsZWFudXA6Cj4gIAlkcm1fY29ubmVjdG9yX2NsZWFudXAoJmRzaS0+Y29ubik7Cj4g
IAlyZXR1cm4gcmV0OwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVs
LWdmeA==
