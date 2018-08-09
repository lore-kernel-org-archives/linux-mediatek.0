From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 03/14] drm/mediatek: add connection from RDMA1 to DSI0
Date: Thu, 9 Aug 2018 10:15:38 +0800
Message-ID: <1533780949-30141-4-git-send-email-stu.hsieh@mediatek.com>
References: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgY29ubmVjdGlvbiBmcm9tIFJETUExIHRvIERTSTAKClNpZ25lZC1vZmYt
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDMxMGQ4NDgyZDVhMC4uMzExODlm
YWQ4ZDRlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwpAQCAtMTI0LDYg
KzEyNCw3IEBACiAjZGVmaW5lIERQSTBfU0VMX0lOX1JETUEyCQkweDMKICNkZWZpbmUgRFBJMV9T
RUxfSU5fUkRNQTEJCSgweDEgPDwgOCkKICNkZWZpbmUgRFBJMV9TRUxfSU5fUkRNQTIJCSgweDMg
PDwgOCkKKyNkZWZpbmUgRFNJMF9TRUxfSU5fUkRNQTEJCTB4MQogI2RlZmluZSBEU0kxX1NFTF9J
Tl9SRE1BMQkJMHgxCiAjZGVmaW5lIERTSTFfU0VMX0lOX1JETUEyCQkweDQKICNkZWZpbmUgRFNJ
Ml9TRUxfSU5fUkRNQTEJCSgweDEgPDwgMTYpCkBAIC0yOTAsNiArMjkxLDkgQEAgc3RhdGljIHVu
c2lnbmVkIGludCBtdGtfZGRwX3NlbF9pbihlbnVtIG10a19kZHBfY29tcF9pZCBjdXIsCiAJfSBl
bHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05F
TlRfRFBJMSkgewogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19EUElfU0VMX0lOOwogCQl2YWx1
ZSA9IERQSTFfU0VMX0lOX1JETUExOworCX0gZWxzZSBpZiAoY3VyID09IEREUF9DT01QT05FTlRf
UkRNQTEgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTApIHsKKwkJKmFkZHIgPSBESVNQX1JF
R19DT05GSUdfRFNJRV9TRUxfSU47CisJCXZhbHVlID0gRFNJMF9TRUxfSU5fUkRNQTE7CiAJfSBl
bHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMSAmJiBuZXh0ID09IEREUF9DT01QT05F
TlRfRFNJMSkgewogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19EU0lPX1NFTF9JTjsKIAkJdmFs
dWUgPSBEU0kxX1NFTF9JTl9SRE1BMTsKLS0gCjIuMTIuNS4yLmdiZGYyM2FiCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
