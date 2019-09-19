From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 3/9] drm/mediatek: replace writeb() with mtk_dsi_mask()
Date: Thu, 19 Sep 2019 14:58:00 +0800
Message-ID: <20190919065806.111016-4-jitao.shi@mediatek.com>
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

VGhlIHdyaXRlYigpIGlzIHVuYXZhaWxhYmxlIGluIG10ODE3My4gQmVjYXVzZSB0aGUgbXQ4MTcz
IGRzaSBtb2R1bGUKZG9lc24ndCBzdXBwb3J0IDhiaXQgbW9kZSBhY2Nlc3MuCgpTaWduZWQtb2Zm
LWJ5OiBKaXRhbyBTaGkgPGppdGFvLnNoaUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4
IDdlMjRkMDNjZGNjYy4uYWM4ZTgwZTM3OWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNp
LmMKQEAgLTk2MCw3ICs5NjAsOSBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2NtZHEoc3RydWN0IG10
a19kc2kgKmRzaSwgY29uc3Qgc3RydWN0IG1pcGlfZHNpX21zZyAqbXNnKQogCX0KIAogCWZvciAo
aSA9IDA7IGkgPCBtc2ctPnR4X2xlbjsgaSsrKQotCQl3cml0ZWIodHhfYnVmW2ldLCBkc2ktPnJl
Z3MgKyByZWdfY21kcV9vZmYgKyBjbWRxX29mZiArIGkpOworCQltdGtfZHNpX21hc2soZHNpLCAo
cmVnX2NtZHFfb2ZmICsgY21kcV9vZmYgKyBpKSAmICh+MHgzVSksCisJCQkgICAgICgweGZmVUwg
PDwgKCgoaSArIGNtZHFfb2ZmKSAmIDNVKSAqIDhVKSksCisJCQkgICAgIHR4X2J1ZltpXSA8PCAo
KChpICsgY21kcV9vZmYpICYgM1UpICogOFUpKTsKIAogCW10a19kc2lfbWFzayhkc2ksIHJlZ19j
bWRxX29mZiwgY21kcV9tYXNrLCByZWdfdmFsKTsKIAltdGtfZHNpX21hc2soZHNpLCBEU0lfQ01E
UV9TSVpFLCBDTURRX1NJWkUsIGNtZHFfc2l6ZSk7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
