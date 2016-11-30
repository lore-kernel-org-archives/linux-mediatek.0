From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v10 09/13] drm/mediatek: add mipi_tx data rate check
Date: Wed, 30 Nov 2016 19:05:11 +0800
Message-ID: <1480503911.13978.12.camel@mtksdaap41>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-10-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480070076-6196-10-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: YT Shen <yt.shen@mediatek.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

SGksIFlUOgoKCk9uIEZyaSwgMjAxNi0xMS0yNSBhdCAxODozNCArMDgwMCwgWVQgU2hlbiB3cm90
ZToKPiBtb2RpZnkgZGF0YSByYXRlIGxpbWl0YXRpb24gKD5sR2Jwcy9sYW5lKSBmb3IgbWlwaXR4
Cj4gCgpJIHRoaW5rIE1UMjcwMSBEUk0gY2FuIHdvcmsgY29ycmVjdGx5IHdpdGhvdXQgdGhpcyBw
YXRjaC4KV2h5IGRvIHlvdSBwdXQgdGhpcyBwYXRjaCBpbiBNVDI3MDEgc2VyaWVzPwpNYXliZSB5
b3UgY2FuIHNlbmQgdGhpcyBwYXRjaCBpbmRlcGVuZGVudGx5LgoKUmVnYXJkcywKQ0sKCj4gU2ln
bmVkLW9mZi1ieTogc2hhb21pbmcgY2hlbiA8c2hhb21pbmcuY2hlbkBtZWRpYXRlay5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jIHwgNCArKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX21pcGlfdHguYwo+IGluZGV4IGZkODQ5MTQuLjFlZjAwYWMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYwo+IEBAIC0xNzcsNyArMTc3LDkgQEAg
c3RhdGljIGludCBtdGtfbWlwaV90eF9wbGxfcHJlcGFyZShzdHJ1Y3QgY2xrX2h3ICpodykKPiAg
Cj4gIAlkZXZfZGJnKG1pcGlfdHgtPmRldiwgInByZXBhcmU6ICV1IEh6XG4iLCBtaXBpX3R4LT5k
YXRhX3JhdGUpOwo+ICAKPiAtCWlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPj0gNTAwMDAwMDAwKSB7
Cj4gKwlpZiAobWlwaV90eC0+ZGF0YV9yYXRlID4gMTI1MDAwMDAwMCkgewo+ICsJCXJldHVybiAt
RUlOVkFMOwo+ICsJfSBlbHNlIGlmIChtaXBpX3R4LT5kYXRhX3JhdGUgPj0gNTAwMDAwMDAwKSB7
Cj4gIAkJdHhkaXYgPSAxOwo+ICAJCXR4ZGl2MCA9IDA7Cj4gIAkJdHhkaXYxID0gMDsKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
