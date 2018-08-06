From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v3 01/13] drm/mediatek: add connection from RDMA0 to DPI1
Date: Mon, 6 Aug 2018 19:58:08 +0800
Message-ID: <1533556700-26525-2-git-send-email-stu.hsieh@mediatek.com>
References: <1533556700-26525-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533556700-26525-1-git-send-email-stu.hsieh@mediatek.com>
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
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDg3ZTQxOTFjMjUwZS4uMDNlMzYy
OGI1YjBkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwpAQCAtMTA2LDYg
KzEwNiw3IEBACiAjZGVmaW5lIE9WTDFfTU9VVF9FTl9DT0xPUjEJCTB4MQogI2RlZmluZSBHQU1N
QV9NT1VUX0VOX1JETUExCQkweDEKICNkZWZpbmUgUkRNQTBfU09VVF9EUEkwCQkJMHgyCisjZGVm
aW5lIFJETUEwX1NPVVRfRFBJMQkJCTB4MwogI2RlZmluZSBSRE1BMF9TT1VUX0RTSTIJCQkweDQK
ICNkZWZpbmUgUkRNQTBfU09VVF9EU0kzCQkJMHg1CiAjZGVmaW5lIFJETUExX1NPVVRfRFBJMAkJ
CTB4MgpAQCAtMjI0LDYgKzIyNSw5IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9tb3V0
X2VuKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwKIAl9IGVsc2UgaWYgKGN1ciA9PSBERFBfQ09N
UE9ORU5UX1JETUEwICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EUEkwKSB7CiAJCSphZGRyID0g
RElTUF9SRUdfQ09ORklHX0RJU1BfUkRNQTBfU09VVF9FTjsKIAkJdmFsdWUgPSBSRE1BMF9TT1VU
X0RQSTA7CisJfSBlbHNlIGlmIChjdXIgPT0gRERQX0NPTVBPTkVOVF9SRE1BMCAmJiBuZXh0ID09
IEREUF9DT01QT05FTlRfRFBJMSkgeworCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19ESVNQX1JE
TUEwX1NPVVRfRU47CisJCXZhbHVlID0gUkRNQTBfU09VVF9EUEkxOwogCX0gZWxzZSBpZiAoY3Vy
ID09IEREUF9DT01QT05FTlRfUkRNQTAgJiYgbmV4dCA9PSBERFBfQ09NUE9ORU5UX0RTSTIpIHsK
IAkJKmFkZHIgPSBESVNQX1JFR19DT05GSUdfRElTUF9SRE1BMF9TT1VUX0VOOwogCQl2YWx1ZSA9
IFJETUEwX1NPVVRfRFNJMjsKLS0gCjIuMTIuNS4yLmdiZGYyM2FiCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
