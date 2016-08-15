From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: Re: [PATCH v3 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Mon, 15 Aug 2016 14:51:16 +0800
Message-ID: <1471243876.2906.9.camel@mtksdaap41>
References: <1470278311-22528-1-git-send-email-bibby.hsieh@mediatek.com>
 <1470278311-22528-4-git-send-email-bibby.hsieh@mediatek.com>
 <1470899712.2493.16.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470899712.2493.16.camel@pengutronix.de>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

SGksIFBoaWxpcHAsCgpPbiBUaHUsIDIwMTYtMDgtMTEgYXQgMDk6MTUgKzAyMDAsIFBoaWxpcHAg
WmFiZWwgd3JvdGU6Cj4gQW0gRG9ubmVyc3RhZywgZGVuIDA0LjA4LjIwMTYsIDEwOjM4ICswODAw
IHNjaHJpZWIgQmliYnkgSHNpZWg6Cj4gPiBGcm9tOiBKdW56aGkgWmhhbyA8anVuemhpLnpoYW9A
bWVkaWF0ZWsuY29tPgo+ID4gCj4gPiBQaXhlbCBjbG9jayBzaG91bGQgYmUgMjk3TUh6IHdoZW4g
cmVzb2x1dGlvbiBpcyA0Sy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSnVuemhpIFpoYW8gPGp1
bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxi
aWJieS5oc2llaEBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RwaS5jIHwgICAgOCArKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcGkuYwo+ID4gaW5kZXggZDA1Y2E3OS4uYTkwYWY1OSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMKPiA+IEBAIC00MzgsMTAgKzQzOCwxNCBAQCBzdGF0aWMgaW50IG10
a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ID4gIAl9Cj4gPiAg
Cj4gPiAgCXBpeF9yYXRlID0gMTAwMFVMICogbW9kZS0+Y2xvY2s7Cj4gPiAtCWlmIChtb2RlLT5j
bG9jayA8PSA3NDAwMCkKPiA+ICsJaWYgKG1vZGUtPmNsb2NrIDw9IDI3MDAwKQo+ID4gKwkJZmFj
dG9yID0gMTYgKiAzOwo+ID4gKwllbHNlIGlmIChtb2RlLT5jbG9jayA8PSA3NDI1MCkKPiA+ICAJ
CWZhY3RvciA9IDggKiAzOwo+ID4gLQllbHNlCj4gPiArCWVsc2UgaWYgKG1vZGUtPmNsb2NrIDw9
IDE2NzAwMCkKPiA+ICAJCWZhY3RvciA9IDQgKiAzOwo+ID4gKwllbHNlCj4gPiArCQlmYWN0b3Ig
PSAyICogMzsKPiA+ICAJcGxsX3JhdGUgPSBwaXhfcmF0ZSAqIGZhY3RvcjsKPiA+ICAKPiA+ICAJ
ZGV2X2RiZyhkcGktPmRldiwgIldhbnQgUExMICVsdSBIeiwgcGl4ZWwgY2xvY2sgJWx1IEh6XG4i
LAo+IAo+IENvdWxkIHlvdSBhZGQgYSBjb21tZW50IHdoeSB0aGlzIGFsc28gY2hhbmdlcyB0aGUg
NzQgTUh6IGxpbWl0IHRvIDc0LjI1Cj4gTUh6IGFuZCB0aGF0IGFkZHMgYSBmYWN0b3IgMTYqMyBm
b3IgY2xvY2tzIDw9IDI3IE1IeiA/Cj4gCkJlY2F1c2UgdGhlIHZhbGlkIHJhbmdlIG9mIHR2ZHBs
bCBpcyBmcm9tIDFHSHogdG8gMkdIeiwgc28sIHdlIGhhdmUgdG8KbWFrZSB0aGUgY2xvY2sgdG8g
Zml0IHRoYXQuCgo+IHJlZ2FyZHMKPiBQaGlsaXBwCj4gCgotLSAKQmliYnkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
