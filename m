From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v1 10/15] drm/mediatek: add drm_device in RDMA for mamory mode
 to reaquest buffer
Date: Tue, 24 Jul 2018 16:17:10 +0800
Message-ID: <1532420235-22268-11-git-send-email-stu.hsieh@mediatek.com>
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

SWYgUkRNQSB3YW50IHRvIHJlcXVlc3QgZ2VtIGJ1ZmZlciwgaXQgbmVlZCB0byBzYXZlIHRoZSBk
cm0gZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogU3R1IEhzaWVoIDxzdHUuaHNpZWhAbWVkaWF0ZWsu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2Rpc3BfcmRtYS5jCmluZGV4IDQ5ZWRiYWU1MDE2Ny4uOGQ0MWY1Y2Q0ODViIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKQEAgLTcyLDYgKzcyLDcgQEAg
c3RydWN0IG10a19kaXNwX3JkbWEgewogCXN0cnVjdCBtdGtfZGRwX2NvbXAJCWRkcF9jb21wOwog
CXN0cnVjdCBkcm1fY3J0YwkJCSpjcnRjOwogCWNvbnN0IHN0cnVjdCBtdGtfZGlzcF9yZG1hX2Rh
dGEJKmRhdGE7CisJc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXY7CiAJYm9vbCByZG1hX21lbW9y
eV9tb2RlOwogfTsKIApAQCAtMjQwLDYgKzI0MSw3IEBAIHN0YXRpYyBpbnQgbXRrX2Rpc3BfcmRt
YV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLAogewogCXN0
cnVjdCBtdGtfZGlzcF9yZG1hICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJc3RydWN0
IG10a19kZHBfY29tcCAqY29tcCA9ICZwcml2LT5kZHBfY29tcDsKKwlzdHJ1Y3QgbXRrX2Rpc3Bf
cmRtYSAqcmRtYSA9IGNvbXBfdG9fcmRtYShjb21wKTsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
X2RldiA9IGRhdGE7CiAJaW50IHJldDsKIApAQCAtMjUwLDYgKzI1Miw3IEBAIHN0YXRpYyBpbnQg
bXRrX2Rpc3BfcmRtYV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFz
dGVyLAogCQlyZXR1cm4gcmV0OwogCX0KIAorCXJkbWEtPmRybV9kZXYgPSBkcm1fZGV2OwogCiAJ
Y29tcC0+Y29tcF9tb2RlID0gJnByaXYtPnJkbWFfbWVtb3J5X21vZGU7CiAKLS0gCjIuMTIuNQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
