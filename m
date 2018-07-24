From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v1 14/15] drm/mediatek: fixed the error value for add DSI1 in
 mutex
Date: Tue, 24 Jul 2018 16:17:14 +0800
Message-ID: <1532420235-22268-15-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBmaXhlZCB0aGUgZXJyb3IgdmFsdWUgZm9yIGFkZCBEU0kxIGluIG11dGV4CgpT
aWduZWQtb2ZmLWJ5OiBTdHUgSHNpZWggPHN0dS5oc2llaEBtZWRpYXRlay5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2RkcC5jCmluZGV4IDMyMzlmMjI3ODVmZC4uYWMwNDdmZGIxYTJiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHAuYwpAQCAtNDM3LDcgKzQzNyw3IEBAIHZvaWQgbXRr
X2Rpc3BfbXV0ZXhfYWRkX2NvbXAoc3RydWN0IG10a19kaXNwX211dGV4ICptdXRleCwKIAkJcmVn
ID0gTVVURVhfU09GX0RTSTA7CiAJCWJyZWFrOwogCWNhc2UgRERQX0NPTVBPTkVOVF9EU0kxOgot
CQlyZWcgPSBNVVRFWF9TT0ZfRFNJMDsKKwkJcmVnID0gTVVURVhfU09GX0RTSTE7CiAJCWJyZWFr
OwogCWNhc2UgRERQX0NPTVBPTkVOVF9EU0kyOgogCQlyZWcgPSBNVVRFWF9TT0ZfRFNJMjsKLS0g
CjIuMTIuNQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
