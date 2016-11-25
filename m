From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH v10 10/13] drm/mediatek: add dsi ulp mode control
Date: Fri, 25 Nov 2016 18:34:33 +0800
Message-ID: <1480070076-6196-11-git-send-email-yt.shen@mediatek.com>
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

bW9kaWZ5IGRzaSBlbnRlciB1bHRyYSBsb3cgcG93ZXIgbW9kZSBtZXRob2QKClNpZ25lZC1vZmYt
Ynk6IHNoYW9taW5nIGNoZW4gPHNoYW9taW5nLmNoZW5AbWVkaWF0ZWsuY29tPgpTaWduZWQtb2Zm
LWJ5OiBZVCBTaGVuIDx5dC5zaGVuQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RzaS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5jCmluZGV4IGQw
M2EwZjEuLjAxZGY4MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwpAQCAtMjg5LDcg
KzI4OSw3IEBAIHN0YXRpYyBpbnQgbXRrX2RzaV9wb3dlcm9uKHN0cnVjdCBtdGtfZHNpICpkc2kp
CiBzdGF0aWMgdm9pZCBtdGtfZHNpX2Nsa191bHBfbW9kZV9lbnRlcihzdHJ1Y3QgbXRrX2RzaSAq
ZHNpKQogewogCW10a19kc2lfbWFzayhkc2ksIERTSV9QSFlfTENDT04sIExDX0hTX1RYX0VOLCAw
KTsKLQltdGtfZHNpX21hc2soZHNpLCBEU0lfUEhZX0xDQ09OLCBMQ19VTFBNX0VOLCAwKTsKKwlt
dGtfZHNpX21hc2soZHNpLCBEU0lfUEhZX0xDQ09OLCBMQ19VTFBNX0VOLCBMQ19VTFBNX0VOKTsK
IH0KIAogc3RhdGljIHZvaWQgbXRrX2RzaV9jbGtfdWxwX21vZGVfbGVhdmUoc3RydWN0IG10a19k
c2kgKmRzaSkKQEAgLTMwMiw3ICszMDIsNyBAQCBzdGF0aWMgdm9pZCBtdGtfZHNpX2Nsa191bHBf
bW9kZV9sZWF2ZShzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogc3RhdGljIHZvaWQgbXRrX2RzaV9sYW5l
MF91bHBfbW9kZV9lbnRlcihzdHJ1Y3QgbXRrX2RzaSAqZHNpKQogewogCW10a19kc2lfbWFzayhk
c2ksIERTSV9QSFlfTEQwQ09OLCBMRDBfSFNfVFhfRU4sIDApOwotCW10a19kc2lfbWFzayhkc2ks
IERTSV9QSFlfTEQwQ09OLCBMRDBfVUxQTV9FTiwgMCk7CisJbXRrX2RzaV9tYXNrKGRzaSwgRFNJ
X1BIWV9MRDBDT04sIExEMF9VTFBNX0VOLCBMRDBfVUxQTV9FTik7CiB9CiAKIHN0YXRpYyB2b2lk
IG10a19kc2lfbGFuZTBfdWxwX21vZGVfbGVhdmUoc3RydWN0IG10a19kc2kgKmRzaSkKLS0gCjEu
OS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
