From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/mediatek: Fix an error code in mtk_hdmi_dt_parse_pdata()
Date: Thu, 28 Mar 2019 17:31:30 +0300
Message-ID: <20190328143130.GO32590@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Jie Qiu <jie.qiu@mediatek.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

V2UgZG9uJ3Qgd2FudCB0byBvdmVyd3JpdGUgInJldCIsIGl0IGFscmVhZHkgaG9sZHMgdGhlIGNv
cnJlY3QgZXJyb3IKY29kZS4gIFRoZSAicmVnbWFwIiB2YXJpYWJsZSBtaWdodCBiZSBhIHZhbGlk
IHBvaW50ZXIgYXMgdGhpcyBwb2ludC4KCkZpeGVzOiA4ZjgzZjI2ODkxZTEgKCJkcm0vbWVkaWF0
ZWs6IEFkZCBIRE1JIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4u
Y2FycGVudGVyQG9yYWNsZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19o
ZG1pLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2hkbWkuYwppbmRleCA5MTVjYzg0NjIxYWUuLjU0M2EyNWU1NzY1ZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKQEAgLTE0ODAsNyArMTQ4MCw2IEBAIHN0YXRpYyBp
bnQgbXRrX2hkbWlfZHRfcGFyc2VfcGRhdGEoc3RydWN0IG10a19oZG1pICpoZG1pLAogCWlmIChJ
U19FUlIocmVnbWFwKSkKIAkJcmV0ID0gUFRSX0VSUihyZWdtYXApOwogCWlmIChyZXQpIHsKLQkJ
cmV0ID0gUFRSX0VSUihyZWdtYXApOwogCQlkZXZfZXJyKGRldiwKIAkJCSJGYWlsZWQgdG8gZ2V0
IHN5c3RlbSBjb25maWd1cmF0aW9uIHJlZ2lzdGVyczogJWRcbiIsCiAJCQlyZXQpOwotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
