From: Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 8/9] drm: mediatek: adjust dsi and mipi_tx probe sequence
Date: Thu, 19 Sep 2019 14:58:05 +0800
Message-ID: <20190919065806.111016-9-jitao.shi@mediatek.com>
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

bXRrX21pcGlfdHggaXMgdGhlIHBoeSBvZiBtdGtfZHNpLgptdGtfZHNpIGdldCB0aGUgcGh5KG10
a19taXBpX3R4KSBpbiBwcm9iZSgpLgoKU28sICBtdGtfbWlwaV90eCBpbml0IHNob3VsZCBiZSBh
aGVhZCBvZiBtdGtfZHNpLiBPciBtdGtfZHNpIHdpbGwKZGVmZXIgdG8gd2FpdCBtdGtfbWlwaV90
eCBwcm9iZSBkb25lLgoKU2lnbmVkLW9mZi1ieTogSml0YW8gU2hpIDxqaXRhby5zaGlAbWVkaWF0
ZWsuY29tPgpSZXZpZXdlZC1ieTogQ0sgSHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmMKaW5kZXggOTQ1YmMyMGYxZDMzLi43ZjA3MmNjOTg1MzAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC02NzcsOCArNjc3LDggQEAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgKiBjb25zdCBtdGtfZHJtX2RyaXZlcnNbXSA9IHsKIAkmbXRr
X2Rpc3BfcmRtYV9kcml2ZXIsCiAJJm10a19kcGlfZHJpdmVyLAogCSZtdGtfZHJtX3BsYXRmb3Jt
X2RyaXZlciwKLQkmbXRrX2RzaV9kcml2ZXIsCiAJJm10a19taXBpX3R4X2RyaXZlciwKKwkmbXRr
X2RzaV9kcml2ZXIsCiB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBtdGtfZHJtX2luaXQodm9pZCkK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
