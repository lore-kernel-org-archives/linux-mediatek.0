From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 1/2] drm/mediatek: set vblank_disable_allowed to true
Date: Thu, 29 Sep 2016 11:29:48 +0800
Message-ID: <1475119789-64619-2-git-send-email-bibby.hsieh@mediatek.com>
References: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

TVRLIERSTSBkcml2ZXIgZGlkbid0IHNldCB0aGUgdmJsYW5rX2Rpc2FibGVfYWxsb3dlZCB0bwp0
cnVlLCBpdCBjYXVzZSB0aGF0IHRoZSBpcnFfaGFuZGxlciBpcyBjYWxsZWQgZXZlcnkKMTYuNiBt
cyAoZXZlcnkgdmJsYW5rKSB3aGVuIHRoZSBkaXNwbGF5IGRpZG4ndCBiZSB1cGRhdGVkLgoKU2ln
bmVkLW9mZi1ieTogQmliYnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8ICAgIDEgKwogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
YwppbmRleCBlZWJiN2Q4Li45NDFlYzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYwpAQCAtMjAwLDYgKzIwMCw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogCWlmIChyZXQgPCAwKQogCQlnb3RvIGVycl9jb21wb25l
bnRfdW5iaW5kOwogCisJZHJtLT52YmxhbmtfZGlzYWJsZV9hbGxvd2VkID0gdHJ1ZTsKIAlkcm1f
a21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZHJtKTsK
IAotLSAKMS43LjkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
