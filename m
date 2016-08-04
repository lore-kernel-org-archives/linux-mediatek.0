From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v2 1/7] drm/mediatek: Remove mtk_drm_crtc_check_flush
Date: Thu, 4 Aug 2016 10:59:51 +0800
Message-ID: <1470279597-60453-2-git-send-email-bibby.hsieh@mediatek.com>
References: <1470279597-60453-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1470279597-60453-1-git-send-email-bibby.hsieh@mediatek.com>
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

RnJvbTogRGFuaWVsIEt1cnR6IDxkamt1cnR6QGNocm9taXVtLm9yZz4KClRoaXMgZnVuY3Rpb24g
bm8gbG9uZ2VyIGV4aXN0cy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBLdXJ0eiA8ZGprdXJ0ekBj
aHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IEJpYmJ5IEhzaWVoIDxiaWJieS5oc2llaEBtZWRp
YXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oIHwg
ICAgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX2NydGMuaAppbmRleCA4MWU1NTY2Li40ZDMyY2YxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmgKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5oCkBAIC0yMiw3ICsyMiw2IEBACiAKIGludCBtdGtf
ZHJtX2NydGNfZW5hYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCB1bnNpZ25lZCBp
bnQgcGlwZSk7CiB2b2lkIG10a19kcm1fY3J0Y19kaXNhYmxlX3ZibGFuayhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZHJtLCB1bnNpZ25lZCBpbnQgcGlwZSk7Ci12b2lkIG10a19kcm1fY3J0Y19jaGVja19m
bHVzaChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOwogdm9pZCBtdGtfZHJtX2NydGNfY29tbWl0KHN0
cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CiB2b2lkIG10a19jcnRjX2RkcF9pcnEoc3RydWN0IGRybV9j
cnRjICpjcnRjLCBzdHJ1Y3QgbXRrX2RkcF9jb21wICpvdmwpOwogaW50IG10a19kcm1fY3J0Y19j
cmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCi0tIAoxLjcuOS41CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
