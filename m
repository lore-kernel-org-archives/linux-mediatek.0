From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v1 6/7] drm/mediatek: add a error return value when clock
 driver has been prepared
Date: Mon, 14 May 2018 15:52:42 +0800
Message-ID: <20180514075243.5442-7-bibby.hsieh@mediatek.com>
References: <20180514075243.5442-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20180514075243.5442-1-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RFJNIGRyaXZlciBnZXQgdGhlIGNvbXAtPmNsayBieSBvZl9jbGtfZ2V0KCksIHdlIG9ubHkKYXNz
aWduIE5VTEwgdG8gY29tcC0+Y2xrIHdoZW4gZXJyb3IgaGFwcGVuZWQsIGJ1dCBkbwpub3QgcmV0
dXJuIHRoZSBlcnJvciBudW1iZXIuCgpTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2llaCA8YmliYnku
aHNpZWhAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcF9jb21wLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
ZHBfY29tcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYwpp
bmRleCA0NjcyMzE3ZTNhZDEuLmQzOGE1MzAzZjhmYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jCkBAIC0yODMsNyArMjgzLDcgQEAgaW50IG10a19kZHBf
Y29tcF9pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpub2RlLAog
CWNvbXAtPmlycSA9IG9mX2lycV9nZXQobm9kZSwgMCk7CiAJY29tcC0+Y2xrID0gb2ZfY2xrX2dl
dChub2RlLCAwKTsKIAlpZiAoSVNfRVJSKGNvbXAtPmNsaykpCi0JCWNvbXAtPmNsayA9IE5VTEw7
CisJCXJldHVybiBQVFJfRVJSKGNvbXAtPmNsayk7CiAKIAkvKiBPbmx5IERNQSBjYXBhYmxlIGNv
bXBvbmVudHMgbmVlZCB0aGUgTEFSQiBwcm9wZXJ0eSAqLwogCWNvbXAtPmxhcmJfZGV2ID0gTlVM
TDsKLS0gCjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
