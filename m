From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 6/7] drm/mediatek: plane: Use FB's format's cpp to compute x
 offset
Date: Fri, 29 Jul 2016 17:04:13 +0800
Message-ID: <1469783054-54567-7-git-send-email-bibby.hsieh@mediatek.com>
References: <1469783054-54567-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1469783054-54567-1-git-send-email-bibby.hsieh@mediatek.com>
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
Cc: linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KClVzZSB0aGUgZnJhbWVi
dWZmZXIncyBmb3JtYXQgdG8gY29tcHV0ZSBpdHMgY3BwLCBhbmQgdXNlIGl0IHdoZW4KY2FsY3Vs
YXRpbmcgdGhlIGFkZHJlc3Mgc2hpZnQgdmFsdWUuCgpTaWduZWQtb2ZmLWJ5OiBCaWJieSBIc2ll
aCA8YmliYnkuaHNpZWhAbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX3BsYW5lLmMgfCAgICAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUu
YwppbmRleCBiM2RkYjIwLi5jNDYxYTIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9wbGFuZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX3BsYW5lLmMKQEAgLTEzNSw3ICsxMzUsNyBAQCBzdGF0aWMgdm9pZCBtdGtfcGxhbmVfYXRv
bWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlwaXRjaCA9IGZiLT5waXRjaGVz
WzBdOwogCWZvcm1hdCA9IGZiLT5waXhlbF9mb3JtYXQ7CiAKLQlhZGRyICs9IChwbGFuZS0+c3Rh
dGUtPnNyYy54MSA+PiAxNikgKiA0OworCWFkZHIgKz0gKHBsYW5lLT5zdGF0ZS0+c3JjLngxID4+
IDE2KSAqIGRybV9mb3JtYXRfcGxhbmVfY3BwKGZvcm1hdCwgMCk7CiAJYWRkciArPSAocGxhbmUt
PnN0YXRlLT5zcmMueTEgPj4gMTYpICogcGl0Y2g7CiAKIAlzdGF0ZS0+cGVuZGluZy5lbmFibGUg
PSB0cnVlOwotLSAKMS43LjkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
