From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 5/9] drm/mediatek: add frame size control
Date: Thu, 19 Sep 2019 14:58:02 +0800
Message-ID: <20190919065806.111016-6-jitao.shi@mediatek.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190919065806.111016-1-jitao.shi@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

T3VyIG5ldyBEU0kgY2hpcCBoYXMgZnJhbWUgc2l6ZSBjb250cm9sLgpTbyBhZGQgdGhlIGRyaXZl
ciBkYXRhIHRvIGNvbnRyb2wgZm9yIGRpZmZlcmVudCBjaGlwcy4KClNpZ25lZC1vZmYtYnk6IEpp
dGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5o
dUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8
IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMKaW5kZXggMzE0YmZiMWM4MjdiLi42ODc5NGVkZWNmOTYgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYwpAQCAtNzAsNiArNzAsNyBAQAogI2RlZmluZSBEU0lfVkJQ
X05MCQkweDI0CiAjZGVmaW5lIERTSV9WRlBfTkwJCTB4MjgKICNkZWZpbmUgRFNJX1ZBQ1RfTkwJ
CTB4MkMKKyNkZWZpbmUgRFNJX1NJWkVfQ09OCQkweDM4CiAjZGVmaW5lIERTSV9IU0FfV0MJCTB4
NTAKICNkZWZpbmUgRFNJX0hCUF9XQwkJMHg1NAogI2RlZmluZSBEU0lfSEZQX1dDCQkweDU4CkBA
IC0xNTQsNiArMTU1LDcgQEAgc3RydWN0IHBoeTsKIHN0cnVjdCBtdGtfZHNpX2RyaXZlcl9kYXRh
IHsKIAljb25zdCB1MzIgcmVnX2NtZHFfb2ZmOwogCWJvb2wgaGFzX3NoYWRvd19jdGw7CisJYm9v
bCBoYXNfc2l6ZV9jdGw7CiB9OwogCiBzdHJ1Y3QgbXRrX2RzaSB7CkBAIC00MjIsNiArNDI0LDEw
IEBAIHN0YXRpYyB2b2lkIG10a19kc2lfY29uZmlnX3Zkb190aW1pbmcoc3RydWN0IG10a19kc2kg
KmRzaSkKIAl3cml0ZWwodm0tPnZmcm9udF9wb3JjaCwgZHNpLT5yZWdzICsgRFNJX1ZGUF9OTCk7
CiAJd3JpdGVsKHZtLT52YWN0aXZlLCBkc2ktPnJlZ3MgKyBEU0lfVkFDVF9OTCk7CiAKKwlpZiAo
ZHNpLT5kcml2ZXJfZGF0YS0+aGFzX3NpemVfY3RsKQorCQl3cml0ZWwodm0tPnZhY3RpdmUgPDwg
MTYgfCB2bS0+aGFjdGl2ZSwKKwkJICAgICAgIGRzaS0+cmVncyArIERTSV9TSVpFX0NPTik7CisK
IAlob3Jpem9udGFsX3N5bmNfYWN0aXZlX2J5dGUgPSAodm0tPmhzeW5jX2xlbiAqIGRzaV90bXBf
YnVmX2JwcCAtIDEwKTsKIAogCWlmIChkc2ktPm1vZGVfZmxhZ3MgJiBNSVBJX0RTSV9NT0RFX1ZJ
REVPX1NZTkNfUFVMU0UpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
