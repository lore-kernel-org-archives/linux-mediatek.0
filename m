From: YT Shen <yt.shen@mediatek.com>
Subject: [PATCH] drm/mediatek: stop using drm_vblank_count() as the hw frame
 counter
Date: Fri, 30 Sep 2016 14:45:43 +0800
Message-ID: <1475217943-12427-1-git-send-email-yt.shen@mediatek.com>
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
To: Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com, Jie Qiu <jie.qiu@mediatek.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

dXNpbmcgZHJtX3ZibGFua19ub19od19jb3VudGVyKCkgdG8gZWxpbWluYXRlIGtlcm5lbCB3YXJu
aW5nLgoKU2lnbmVkLW9mZi1ieTogWVQgU2hlbiA8eXQuc2hlbkBtZWRpYXRlay5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jCmluZGV4IGVlYmI3ZDguLmUyODYxOTMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0yMzksNyArMjM5LDcgQEAgc3RhdGljIHN0cnVjdCBk
cm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gewogCS5kcml2ZXJfZmVhdHVyZXMgPSBEUklWRVJf
TU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfUFJJTUUgfAogCQkJICAgRFJJVkVSX0FUT01J
QywKIAotCS5nZXRfdmJsYW5rX2NvdW50ZXIgPSBkcm1fdmJsYW5rX2NvdW50LAorCS5nZXRfdmJs
YW5rX2NvdW50ZXIgPSBkcm1fdmJsYW5rX25vX2h3X2NvdW50ZXIsCiAJLmVuYWJsZV92Ymxhbmsg
PSBtdGtfZHJtX2NydGNfZW5hYmxlX3ZibGFuaywKIAkuZGlzYWJsZV92YmxhbmsgPSBtdGtfZHJt
X2NydGNfZGlzYWJsZV92YmxhbmssCiAKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
