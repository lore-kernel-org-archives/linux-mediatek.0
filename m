From: CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH] drm/mediatek: fix a typo
Date: Thu, 29 Sep 2016 12:01:22 +0800
Message-ID: <1475121682.18843.2.camel@mtksdaap41>
References: <1475119322-58657-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475119322-58657-1-git-send-email-bibby.hsieh@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Daniel Vetter <daniel.vetter@ffwll.ch>, Cawa Cheng <cawa.cheng@mediatek.com>, dri-devel@lists.freedesktop.org, Mao Huang <littlecvr@chromium.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

QWNrZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+CgpPbiBUaHUsIDIwMTYtMDktMjkg
YXQgMTE6MjIgKzA4MDAsIEJpYmJ5IEhzaWVoIHdyb3RlOgo+IEZpeCB0aGUgdHlwbzogT0RfUkVM
QVlNT0RFLT5PRF9DRkcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnkuaHNp
ZWhAbWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kZHBfY29tcC5jIHwgICAgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rk
cF9jb21wLmMKPiBpbmRleCBkZjMzYjNjLi5hYTVmMjBmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCj4gQEAgLTEyMyw3ICsxMjMsNyBAQCBzdGF0
aWMgdm9pZCBtdGtfb2RfY29uZmlnKHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXAsIHVuc2lnbmVk
IGludCB3LAo+ICAJCQkgIHVuc2lnbmVkIGludCBicGMpCj4gIHsKPiAgCXdyaXRlbCh3IDw8IDE2
IHwgaCwgY29tcC0+cmVncyArIERJU1BfT0RfU0laRSk7Cj4gLQl3cml0ZWwoT0RfUkVMQVlNT0RF
LCBjb21wLT5yZWdzICsgT0RfUkVMQVlNT0RFKTsKPiArCXdyaXRlbChPRF9SRUxBWU1PREUsIGNv
bXAtPnJlZ3MgKyBPRF9DRkcpOwo+ICAJbXRrX2RpdGhlcl9zZXQoY29tcCwgYnBjLCBESVNQX09E
X0NGRyk7Cj4gIH0KPiAgCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
