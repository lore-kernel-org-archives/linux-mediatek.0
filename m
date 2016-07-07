From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v3 0/2] drm/mediatek: MT8173 gamma & dither support
Date: Thu, 7 Jul 2016 15:37:07 +0800
Message-ID: <1467877029-45236-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
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

VGhpcyBpcyBNVDgxNzMgZ2FtbWEgJiBkaXRoZXIgc3VwcG9ydCBQQVRDSCB2MywgYmFzZWQgb24g
NC43LXJjMS4KCkNoYW5nZXMgc2luY2UgdjI6CiAtTW9kaWZ5IGRlZmluZXMgdG8gbWF0Y2ggdGhl
IHJlZ2lzdGVyIGZpZWxkIG5hbWVzIGluIHRoZSBNVDgxNzMgZGF0YXNoZWV0CiAtTWFkZSBkaXRo
ZXJpbmcgZnVuY3Rpb24gc3VwcG9ydCBoYXJkd2FyZSBtaXJyb3Jpbmcgd2VsbCBvbiB0d28gIG1v
bml0b3IuCgpCaWJieSBIc2llaCAoMik6CiAgZHJtL21lZGlhdGVrOiBBZGQgZ2FtbWEgY29ycmVj
dGlvbgogIGRybS9tZWRpYXRlazogc2V0IG10ODE3MyBkaXRoZXJpbmcgZnVuY3Rpb24KCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgICAgIHwgICAgMyArLQogZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyAgICB8ICAgIDMgKy0KIGRyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYyAgICAgfCAgIDI5ICsrKystCiBkcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmggICAgIHwgICAgMSArCiBkcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29tcC5jIHwgIDE1NCArKysrKysrKysrKysrKysr
KysrKysrKysrLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmgg
fCAgIDE2ICsrLQogNiBmaWxlcyBjaGFuZ2VkLCAxOTIgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgotLSAKMS43LjkuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCg==
