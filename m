From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v1 04/15] drm/mediatek: add connection from RDMA2 to DSI0
Date: Tue, 24 Jul 2018 16:17:04 +0800
Message-ID: <1532420235-22268-5-git-send-email-stu.hsieh@mediatek.com>
References: <1532420235-22268-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1532420235-22268-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9tIFJETUEyIHRvIERTSTAKClNpZ25lZC1vZmYt
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMKaW5kZXggMzEx
ODlmYWQ4ZDRlLi4zMjM5ZjIyNzg1ZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2RkcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2RkcC5jCkBAIC0xMjUsNiArMTI1LDcgQEAKICNkZWZpbmUgRFBJMV9TRUxfSU5fUkRNQTEJCSgw
eDEgPDwgOCkKICNkZWZpbmUgRFBJMV9TRUxfSU5fUkRNQTIJCSgweDMgPDwgOCkKICNkZWZpbmUg
RFNJMF9TRUxfSU5fUkRNQTEJCTB4MQorI2RlZmluZSBEU0kwX1NFTF9JTl9SRE1BMgkJMHg0CiAj
ZGVmaW5lIERTSTFfU0VMX0lOX1JETUExCQkweDEKICNkZWZpbmUgRFNJMV9TRUxfSU5fUkRNQTIJ
CTB4NAogI2RlZmluZSBEU0kyX1NFTF9JTl9SRE1BMQkJKDB4MSA8PCAxNikKQEAgLTMwOSw2ICsz
MTAsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG10a19kZHBfc2VsX2luKGVudW0gbXRrX2RkcF9j
b21wX2lkIGN1ciwKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEyICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9EUEkxKSB7CiAJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RQ
SV9TRUxfSU47CiAJCXZhbHVlID0gRFBJMV9TRUxfSU5fUkRNQTI7CisJfSBlbHNlIGlmIChjdXIg
PT0gRERQX0NPTVBPTkVOVF9SRE1BMiAmJiBuZXh0ID09IEREUF9DT01QT05FTlRfRFNJMCkgewor
CQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19EU0lFX1NFTF9JTjsKKwkJdmFsdWUgPSBEU0kwX1NF
TF9JTl9SRE1BMjsKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEyICYmIG5l
eHQgPT0gRERQX0NPTVBPTkVOVF9EU0kxKSB7CiAJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RT
SUVfU0VMX0lOOwogCQl2YWx1ZSA9IERTSTFfU0VMX0lOX1JETUEyOwotLSAKMi4xMi41CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
