From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v10 11/13] drm/mediatek: add dsi rxtx control
Date: Fri, 25 Nov 2016 18:34:34 +0800
Message-ID: <1480070076-6196-12-git-send-email-yt.shen@mediatek.com>
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

YWRkIG5vbi1jb250aW51b3VzIGNsb2NrIG1vZGUgYW5kIEVPVCBwYWNrZXQgY29udHJvbCBmb3Ig
ZHNpCgpTaWduZWQtb2ZmLWJ5OiBzaGFvbWluZyBjaGVuIDxzaGFvbWluZy5jaGVuQG1lZGlhdGVr
LmNvbT4KU2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHNpLmMKaW5kZXggMDFk
ZjgyOS4uZGVkNDIwMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
c2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCkBAIC0zOTksNiAr
Mzk5LDkgQEAgc3RhdGljIHZvaWQgbXRrX2RzaV9yeHR4X2NvbnRyb2woc3RydWN0IG10a19kc2kg
KmRzaSkKIAkJYnJlYWs7CiAJfQogCisJdG1wX3JlZyB8PSAoZHNpLT5tb2RlX2ZsYWdzICYgTUlQ
SV9EU0lfQ0xPQ0tfTk9OX0NPTlRJTlVPVVMpIDw8IDY7CisJdG1wX3JlZyB8PSAoZHNpLT5tb2Rl
X2ZsYWdzICYgTUlQSV9EU0lfTU9ERV9FT1RfUEFDS0VUKSA+PiAzOworCiAJd3JpdGVsKHRtcF9y
ZWcsIGRzaS0+cmVncyArIERTSV9UWFJYX0NUUkwpOwogfQogCi0tIAoxLjkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
