From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 14/14] drm/mediatek: fix connection from RDMA2 to DSI1
Date: Thu, 9 Aug 2018 10:15:49 +0800
Message-ID: <1533780949-30141-15-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBmaXggY29ubmVjdGlvbiBmcm9tIFJETUEyIHRvIERTSTEKClNpZ25lZC1vZmYt
Ynk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1
IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cm1fZGRwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcC5jCmluZGV4IDMyMzlmMjI3
ODVmZC4uNTQ2YjNlM2IzMDBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAu
YwpAQCAtMzE0LDcgKzMxNCw3IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgbXRrX2RkcF9zZWxfaW4o
ZW51bSBtdGtfZGRwX2NvbXBfaWQgY3VyLAogCQkqYWRkciA9IERJU1BfUkVHX0NPTkZJR19EU0lF
X1NFTF9JTjsKIAkJdmFsdWUgPSBEU0kwX1NFTF9JTl9SRE1BMjsKIAl9IGVsc2UgaWYgKGN1ciA9
PSBERFBfQ09NUE9ORU5UX1JETUEyICYmIG5leHQgPT0gRERQX0NPTVBPTkVOVF9EU0kxKSB7Ci0J
CSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RTSUVfU0VMX0lOOworCQkqYWRkciA9IERJU1BfUkVH
X0NPTkZJR19EU0lPX1NFTF9JTjsKIAkJdmFsdWUgPSBEU0kxX1NFTF9JTl9SRE1BMjsKIAl9IGVs
c2UgaWYgKGN1ciA9PSBERFBfQ09NUE9ORU5UX1JETUEyICYmIG5leHQgPT0gRERQX0NPTVBPTkVO
VF9EU0kyKSB7CiAJCSphZGRyID0gRElTUF9SRUdfQ09ORklHX0RTSUVfU0VMX0lOOwotLSAKMi4x
Mi41LjIuZ2JkZjIzYWIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
