From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v5 11/11] drm/mediatek: add a error return value when clock
 driver has been prepared
Date: Wed, 3 Oct 2018 11:41:51 +0800
Message-ID: <20181003034151.31452-12-bibby.hsieh@mediatek.com>
References: <20181003034151.31452-1-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20181003034151.31452-1-bibby.hsieh@mediatek.com>
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
aHNpZWhAbWVkaWF0ZWsuY29tPgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMKaW5kZXggZmY5NzRkODJhNGE2
Li41NGNhNzk0ZGIzZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2RkcF9jb21wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRw
X2NvbXAuYwpAQCAtMjk0LDcgKzI5NCw3IEBAIGludCBtdGtfZGRwX2NvbXBfaW5pdChzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSwKIAljb21wLT5pcnEgPSBvZl9p
cnFfZ2V0KG5vZGUsIDApOwogCWNvbXAtPmNsayA9IG9mX2Nsa19nZXQobm9kZSwgMCk7CiAJaWYg
KElTX0VSUihjb21wLT5jbGspKQotCQljb21wLT5jbGsgPSBOVUxMOworCQlyZXR1cm4gUFRSX0VS
Uihjb21wLT5jbGspOwogCiAJLyogT25seSBETUEgY2FwYWJsZSBjb21wb25lbnRzIG5lZWQgdGhl
IExBUkIgcHJvcGVydHkgKi8KIAljb21wLT5sYXJiX2RldiA9IE5VTEw7Ci0tIAoyLjEyLjUuMi5n
YmRmMjNhYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
