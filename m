From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v10 11/13] drm/mediatek: add dsi rxtx control
Date: Wed, 30 Nov 2016 18:47:04 +0800
Message-ID: <1480502824.13978.8.camel@mtksdaap41>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
 <1480070076-6196-12-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480070076-6196-12-git-send-email-yt.shen@mediatek.com>
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

SGksIFlUOgoKT24gRnJpLCAyMDE2LTExLTI1IGF0IDE4OjM0ICswODAwLCBZVCBTaGVuIHdyb3Rl
Ogo+IGFkZCBub24tY29udGludW91cyBjbG9jayBtb2RlIGFuZCBFT1QgcGFja2V0IGNvbnRyb2wg
Zm9yIGRzaQo+IAoKSSB0aGluayBjb21taXQgdGl0bGUgc2hvdWxkIGJlICdkcm0vbWVkaWF0ZWs6
IGFkZCBub24tY29udGludW91cyBjbG9jawptb2RlIGFuZCBFT1QgcGFja2V0IGNvbnRyb2wgZm9y
IGRzaScsIGFuZCBjb21taXQgbWVzc2FnZSBzaG91bGQgZGVzY3JpYmUKbW9yZSBpbmZvcm1hdGlv
biBhYm91dCB0aGlzIG1vZGlmaWNhdGlvbi4gRm9yIGV4YW1wbGUsIHdoYXQgaXMgdGhlCmRpZmZl
cmVuY2UgYmV0d2VlbiB3aXRoIGFuZCB3aXRob3V0IHRoaXMgcGF0Y2guIERvZXMgaXQgZml4IGFu
eSBwcm9ibGVtPwoKUmVnYXJkcywKQ0sKCj4gU2lnbmVkLW9mZi1ieTogc2hhb21pbmcgY2hlbiA8
c2hhb21pbmcuY2hlbkBtZWRpYXRlay5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQu
c2hlbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMgfCAzICsrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gaW5kZXggMDFkZjgyOS4uZGVkNDIwMiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwo+IEBAIC0zOTksNiArMzk5LDkgQEAgc3RhdGlj
IHZvaWQgbXRrX2RzaV9yeHR4X2NvbnRyb2woc3RydWN0IG10a19kc2kgKmRzaSkKPiAgCQlicmVh
azsKPiAgCX0KPiAgCj4gKwl0bXBfcmVnIHw9IChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9D
TE9DS19OT05fQ09OVElOVU9VUykgPDwgNjsKPiArCXRtcF9yZWcgfD0gKGRzaS0+bW9kZV9mbGFn
cyAmIE1JUElfRFNJX01PREVfRU9UX1BBQ0tFVCkgPj4gMzsKPiArCj4gIAl3cml0ZWwodG1wX3Jl
ZywgZHNpLT5yZWdzICsgRFNJX1RYUlhfQ1RSTCk7Cj4gIH0KPiAgCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
