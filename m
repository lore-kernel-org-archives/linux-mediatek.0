From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v2 01/15] drm/mediatek: add connection from RDMA0 to DPI1
Date: Fri, 3 Aug 2018 11:10:54 +0800
Message-ID: <1533265868-28110-2-git-send-email-stu.hsieh@mediatek.com>
References: <1533265868-28110-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533265868-28110-1-git-send-email-stu.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Stu Hsieh <stu.hsieh@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

VGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9tIFJETUEwIHRvIERQSTEKClNpZ25lZC1vZmYt
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggODdl
NDE5MWMyNTBlLi4wM2UzNjI4YjViMGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jCkBAIC0xMDYsNiArMTA2LDcgQEAKICNkZWZpbmUgT1ZMMV9NT1VUX0VOX0NPTE9SMQkJ
MHgxCiAjZGVmaW5lIEdBTU1BX01PVVRfRU5fUkRNQTEJCTB4MQogI2RlZmluZSBSRE1BMF9TT1VU
X0RQSTAJCQkweDIKKyNkZWZpbmUgUkRNQTBfU09VVF9EUEkxCQkJMHgzCiAjZGVmaW5lIFJETUEw
X1NPVVRfRFNJMgkJCTB4NAogI2RlZmluZSBSRE1BMF9TT1VUX0RTSTMJCQkweDUKICNkZWZpbmUg
UkRNQTFfU09VVF9EUEkwCQkJMHgyCkBAIC0yMjQsNiArMjI1LDkgQEAgc3RhdGljIHVuc2lnbmVk
IGludCBtdGtfZGRwX21vdXRfZW4oZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAogCX0gZWxzZSBp
ZiAoY3VyID09IEREUF9DT01QT05FTlRfUkRNQTAgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RQ
STApIHsKIAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9TT1VUX0VOOwogCQl2
YWx1ZSA9IFJETUEwX1NPVVRfRFBJMDsKKwl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5U
X1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkxKSB7CisJCSphZGRyID0gRElTUF9S
RUdfQ09ORklHX0RJU1BfUkRNQTBfU09VVF9FTjsKKwkJdmFsdWUgPSBSRE1BMF9TT1VUX0RQSTE7
CiAJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09IEREUF9D
T01QT05FTlRfRFNJMikgewogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JETUEwX1NP
VVRfRU47CiAJCXZhbHVlID0gUkRNQTBfU09VVF9EU0kyOwotLSAKMi4xMi41LjIuZ2JkZjIzYWIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
