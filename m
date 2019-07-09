From: Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v6 4/4] drm/mtk: add panel orientation property
Date: Tue,  9 Jul 2019 15:58:40 -0700
Message-ID: <20190709225840.144038-5-dbasehore@chromium.org>
References: <20190709225840.144038-1-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <20190709225840.144038-1-dbasehore@chromium.org>
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
aXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jCmluZGV4IGI5MWM0NjE2NjQ0YS4uMjkyMDQ1OGFlMmZiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHNpLmMKQEAgLTc5MCwxMCArNzkwLDE4IEBAIHN0YXRpYyBpbnQgbXRrX2Rz
aV9jcmVhdGVfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVjdCBtdGtfZHNp
ICpkc2kpCiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBhdHRhY2ggcGFuZWwgdG8gZHJtXG4iKTsK
IAkJCWdvdG8gZXJyX2Nvbm5lY3Rvcl9jbGVhbnVwOwogCQl9CisKKwkJcmV0ID0gZHJtX2Nvbm5l
Y3Rvcl9pbml0X3BhbmVsX29yaWVudGF0aW9uX3Byb3BlcnR5KCZkc2ktPmNvbm4pOworCQlpZiAo
cmV0KSB7CisJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBpbml0IHBhbmVsIG9yaWVudGF0aW9uXG4i
KTsKKwkJCWdvdG8gZXJyX3BhbmVsX2RldGFjaDsKKwkJfQogCX0KIAogCXJldHVybiAwOwogCitl
cnJfcGFuZWxfZGV0YWNoOgorCWRybV9wYW5lbF9kZXRhY2goZHNpLT5wYW5lbCk7CiBlcnJfY29u
bmVjdG9yX2NsZWFudXA6CiAJZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwKCZkc2ktPmNvbm4pOwogCXJl
dHVybiByZXQ7Ci0tIAoyLjIyLjAuNDEwLmdkOGZkYmUyMWI1LWdvb2cKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QK
SW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA==
