From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v5 08/11] drm/mediatek: add support for SPDIF audio in HDMI
Date: Wed, 3 Oct 2018 11:41:48 +0800
Message-ID: <20181003034151.31452-9-bibby.hsieh@mediatek.com>
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
Cc: chunhui dai <chunhui.dai@mediatek.com>, linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Thierry Reding <thierry.reding@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogY2h1bmh1aSBkYWkgPGNodW5odWkuZGFpQG1lZGlhdGVrLmNvbT4KCmFkZCBzdXBwb3J0
IGZvciBTUERJRiBhdWRpbyAgaW4gSERNSQoKU2lnbmVkLW9mZi1ieTogY2h1bmh1aSBkYWkgPGNo
dW5odWkuZGFpQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRl
ay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgfCA1ICsrKysr
CiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2hkbWkuYwppbmRleCAyY2E5ZjZhNjRkYWIuLmQ2MmU2ODVjZWM3MyAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19oZG1pLmMKQEAgLTE1NzYsNiArMTU3NiwxMSBAQCBzdGF0aWMgaW50IG10a19o
ZG1pX2F1ZGlvX2h3X3BhcmFtcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCWhk
bWlfcGFyYW1zLmF1ZF9pMnNfZm10ID0gSERNSV9JMlNfTU9ERV9JMlNfMjRCSVQ7CiAJCWhkbWlf
cGFyYW1zLmF1ZF9tY2xrID0gSERNSV9BVURfTUNMS18xMjhGUzsKIAkJYnJlYWs7CisJY2FzZSBI
RE1JX1NQRElGOgorCQloZG1pX3BhcmFtcy5hdWRfY29kZWMgPSBIRE1JX0FVRElPX0NPRElOR19U
WVBFX1BDTTsKKwkJaGRtaV9wYXJhbXMuYXVkX3NhbXBlX3NpemUgPSBIRE1JX0FVRElPX1NBTVBM
RV9TSVpFXzE2OworCQloZG1pX3BhcmFtcy5hdWRfaW5wdXRfdHlwZSA9IEhETUlfQVVEX0lOUFVU
X1NQRElGOworCQlicmVhazsKIAlkZWZhdWx0OgogCQlkZXZfZXJyKGhkbWktPmRldiwgIiVzOiBJ
bnZhbGlkIERBSSBmb3JtYXQgJWRcbiIsIF9fZnVuY19fLAogCQkJZGFpZm10LT5mbXQpOwotLSAK
Mi4xMi41LjIuZ2JkZjIzYWIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
