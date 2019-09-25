From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v8 4/4] drm/mtk: add panel orientation property
Date: Wed, 25 Sep 2019 15:58:33 -0700
Message-ID: <20190925225833.7310-5-dbasehore@chromium.org>
References: <20190925225833.7310-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190925225833.7310-1-dbasehore@chromium.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: linux-kernel@vger.kernel.org
Cc: Derek Basehore <dbasehore@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, intel-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhpcyBpbml0cyB0aGUgcGFuZWwgb3JpZW50YXRpb24gcHJvcGVydHkgZm9yIHRoZSBtZWRpYXRl
ayBkc2kgZHJpdmVyCmlmIHRoZSBwYW5lbCBvcmllbnRhdGlvbiAoY29ubmVjdG9yLmRpc3BsYXlf
aW5mby5wYW5lbF9vcmllbnRhdGlvbikgaXMKbm90IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9O
X1VOS05PV04uCgpTaWduZWQtb2ZmLWJ5OiBEZXJlayBCYXNlaG9yZSA8ZGJhc2Vob3JlQGNocm9t
aXVtLm9yZz4KQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3
ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCAyMjRhZmI2NjY4ODEuLjI5
MzY5MzIzNDRlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2ku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC03OTIsMTAgKzc5
MiwxOCBAQCBzdGF0aWMgaW50IG10a19kc2lfY3JlYXRlX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCBzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
YXR0YWNoIHBhbmVsIHRvIGRybVxuIik7CiAJCQlnb3RvIGVycl9jb25uZWN0b3JfY2xlYW51cDsK
IAkJfQorCisJCXJldCA9IGRybV9jb25uZWN0b3JfaW5pdF9wYW5lbF9vcmllbnRhdGlvbl9wcm9w
ZXJ0eSgmZHNpLT5jb25uKTsKKwkJaWYgKHJldCkgeworCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8g
aW5pdCBwYW5lbCBvcmllbnRhdGlvblxuIik7CisJCQlnb3RvIGVycl9wYW5lbF9kZXRhY2g7CisJ
CX0KIAl9CiAKIAlyZXR1cm4gMDsKIAorZXJyX3BhbmVsX2RldGFjaDoKKwlkcm1fcGFuZWxfZGV0
YWNoKGRzaS0+cGFuZWwpOwogZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOgogCWRybV9jb25uZWN0b3Jf
Y2xlYW51cCgmZHNpLT5jb25uKTsKIAlyZXR1cm4gcmV0OwotLSAKMi4yMy4wLjM1MS5nYzQzMTcw
MzJlNi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1nZng=
