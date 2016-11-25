From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v10 09/13] drm/mediatek: add mipi_tx data rate check
Date: Fri, 25 Nov 2016 18:34:32 +0800
Message-ID: <1480070076-6196-10-git-send-email-yt.shen@mediatek.com>
References: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1480070076-6196-1-git-send-email-yt.shen@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Jie Qiu <jie.qiu@mediatek.com>, Mao Huang <littlecvr@chromium.org>, yingjoe.chen@mediatek.com, Dan Carpenter <dan.carpenter@oracle.com>, Jitao Shi <jitao.shi@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, shaoming chen <shaoming.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org, srv_heupstream@mediatek.com, emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org, Sascha Hauer <kernel@pengutronix.de>, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: linux-mediatek@lists.infradead.org

bW9kaWZ5IGRhdGEgcmF0ZSBsaW1pdGF0aW9uICg+bEdicHMvbGFuZSkgZm9yIG1pcGl0eAoKU2ln
bmVkLW9mZi1ieTogc2hhb21pbmcgY2hlbiA8c2hhb21pbmcuY2hlbkBtZWRpYXRlay5jb20+ClNp
Z25lZC1vZmYtYnk6IFlUIFNoZW4gPHl0LnNoZW5AbWVkaWF0ZWsuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X21pcGlfdHguYwppbmRleCBmZDg0OTE0Li4xZWYwMGFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX21pcGlfdHguYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX21pcGlfdHguYwpAQCAtMTc3LDcgKzE3Nyw5IEBAIHN0YXRpYyBpbnQgbXRrX21pcGlf
dHhfcGxsX3ByZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCiAKIAlkZXZfZGJnKG1pcGlfdHgtPmRl
diwgInByZXBhcmU6ICV1IEh6XG4iLCBtaXBpX3R4LT5kYXRhX3JhdGUpOwogCi0JaWYgKG1pcGlf
dHgtPmRhdGFfcmF0ZSA+PSA1MDAwMDAwMDApIHsKKwlpZiAobWlwaV90eC0+ZGF0YV9yYXRlID4g
MTI1MDAwMDAwMCkgeworCQlyZXR1cm4gLUVJTlZBTDsKKwl9IGVsc2UgaWYgKG1pcGlfdHgtPmRh
dGFfcmF0ZSA+PSA1MDAwMDAwMDApIHsKIAkJdHhkaXYgPSAxOwogCQl0eGRpdjAgPSAwOwogCQl0
eGRpdjEgPSAwOwotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
