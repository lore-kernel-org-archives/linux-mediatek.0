From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v3 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Thu, 11 Aug 2016 09:15:12 +0200
Message-ID: <1470899712.2493.16.camel@pengutronix.de>
References: <1470278311-22528-1-git-send-email-bibby.hsieh@mediatek.com>
 <1470278311-22528-4-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470278311-22528-4-git-send-email-bibby.hsieh@mediatek.com>
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
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

QW0gRG9ubmVyc3RhZywgZGVuIDA0LjA4LjIwMTYsIDEwOjM4ICswODAwIHNjaHJpZWIgQmliYnkg
SHNpZWg6Cj4gRnJvbTogSnVuemhpIFpoYW8gPGp1bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KPiAK
PiBQaXhlbCBjbG9jayBzaG91bGQgYmUgMjk3TUh6IHdoZW4gcmVzb2x1dGlvbiBpcyA0Sy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBKdW56aGkgWmhhbyA8anVuemhpLnpoYW9AbWVkaWF0ZWsuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRpYXRlay5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCAgICA4ICsrKysrKy0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gaW5kZXggZDA1Y2E3OS4uYTkwYWY1OSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC00MzgsMTAgKzQzOCwxNCBAQCBz
dGF0aWMgaW50IG10a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+
ICAJfQo+ICAKPiAgCXBpeF9yYXRlID0gMTAwMFVMICogbW9kZS0+Y2xvY2s7Cj4gLQlpZiAobW9k
ZS0+Y2xvY2sgPD0gNzQwMDApCj4gKwlpZiAobW9kZS0+Y2xvY2sgPD0gMjcwMDApCj4gKwkJZmFj
dG9yID0gMTYgKiAzOwo+ICsJZWxzZSBpZiAobW9kZS0+Y2xvY2sgPD0gNzQyNTApCj4gIAkJZmFj
dG9yID0gOCAqIDM7Cj4gLQllbHNlCj4gKwllbHNlIGlmIChtb2RlLT5jbG9jayA8PSAxNjcwMDAp
Cj4gIAkJZmFjdG9yID0gNCAqIDM7Cj4gKwllbHNlCj4gKwkJZmFjdG9yID0gMiAqIDM7Cj4gIAlw
bGxfcmF0ZSA9IHBpeF9yYXRlICogZmFjdG9yOwo+ICAKPiAgCWRldl9kYmcoZHBpLT5kZXYsICJX
YW50IFBMTCAlbHUgSHosIHBpeGVsIGNsb2NrICVsdSBIelxuIiwKCkNvdWxkIHlvdSBhZGQgYSBj
b21tZW50IHdoeSB0aGlzIGFsc28gY2hhbmdlcyB0aGUgNzQgTUh6IGxpbWl0IHRvIDc0LjI1Ck1I
eiBhbmQgdGhhdCBhZGRzIGEgZmFjdG9yIDE2KjMgZm9yIGNsb2NrcyA8PSAyNyBNSHogPwoKcmVn
YXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
