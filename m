From: CK Hu <ck.hu@mediatek.com>
Subject: [PATCH 2/2] drm/mediatek: Add Mediatek framebuffer device
Date: Wed, 16 Jan 2019 09:39:24 +0800
Message-ID: <20190116013924.11345-2-ck.hu@mediatek.com>
References: <20190116013924.11345-1-ck.hu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190116013924.11345-1-ck.hu@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, =?UTF-8?q?Noralf=20Tr=F8nnes?= <noralf@tronnes.org>, Frank Wunderlich <frank-w@public-files.de>
Cc: srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Rm9yIE1lZGlhdGVrIGRybSBkcml2ZXIsIHVzZSBmYmRldiBlbXVsYXRpb24gdG8gY3JlYXRlIGEg
ZnJhbWVidWZmZXIKZGV2aWNlLgoKU2lnbmVkLW9mZi1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVr
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDUgKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCmluZGV4IDZlYzRjYTA3MDM4Mi4uNWZjYzBlMjk0Njk2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1
ZGUgPGRybS9kcm1fYXRvbWljLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+
CiAjaW5jbHVkZSA8ZHJtL2RybV9jcnRjX2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fZmJf
aGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW0uaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9vZi5oPgpAQCAtMzc4LDYgKzM3OSwx
MCBAQCBzdGF0aWMgaW50IG10a19kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJaWYgKHJl
dCA8IDApCiAJCWdvdG8gZXJyX2RlaW5pdDsKIAorCXJldCA9IGRybV9mYmRldl9nZW5lcmljX3Nl
dHVwKGRybSwgMzIpOworCWlmIChyZXQpCisJCURSTV9FUlJPUigiRmFpbGVkIHRvIGluaXRpYWxp
emUgZmJkZXY6ICVkXG4iLCByZXQpOworCiAJcmV0dXJuIDA7CiAKIGVycl9kZWluaXQ6Ci0tIAoy
LjE4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
