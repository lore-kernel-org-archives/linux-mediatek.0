From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 6/9] drm/mediatek: add mt8183 dsi driver support
Date: Thu, 19 Sep 2019 14:58:03 +0800
Message-ID: <20190919065806.111016-7-jitao.shi@mediatek.com>
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

QWRkIG10ODE4MyBkc2kgZHJpdmVyIGRhdGEuIEVuYWJsZSBzaXplIGNvbnRyb2wgYW5kCnJlZyBj
b21taXQgY29udHJvbC4KClNpZ25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlh
dGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RzaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kc2kuYwppbmRleCA2
ODc5NGVkZWNmOTYuLmIzNjc2NDI2YWViNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RzaS5j
CkBAIC0xMjI3LDExICsxMjI3LDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2
ZXJfZGF0YSBtdDI3MDFfZHNpX2RyaXZlcl9kYXRhID0gewogCS5yZWdfY21kcV9vZmYgPSAweDE4
MCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RzaV9kcml2ZXJfZGF0YSBtdDgxODNf
ZHNpX2RyaXZlcl9kYXRhID0geworCS5yZWdfY21kcV9vZmYgPSAweDIwMCwKKwkuaGFzX3NoYWRv
d19jdGwgPSB0cnVlLAorCS5oYXNfc2l6ZV9jdGwgPSB0cnVlLAorfTsKKwogc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXRrX2RzaV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGli
bGUgPSAibWVkaWF0ZWssbXQyNzAxLWRzaSIsCiAJICAuZGF0YSA9ICZtdDI3MDFfZHNpX2RyaXZl
cl9kYXRhIH0sCiAJeyAuY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxNzMtZHNpIiwKIAkgIC5k
YXRhID0gJm10ODE3M19kc2lfZHJpdmVyX2RhdGEgfSwKKwl7IC5jb21wYXRpYmxlID0gIm1lZGlh
dGVrLG10ODE4My1kc2kiLAorCSAgLmRhdGEgPSAmbXQ4MTgzX2RzaV9kcml2ZXJfZGF0YSB9LAog
CXsgfSwKIH07CiAKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
