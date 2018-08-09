From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH v4 10/14] drm/mediatek: add function to return OVL layer number
Date: Thu, 9 Aug 2018 10:15:45 +0800
Message-ID: <1533780949-30141-11-git-send-email-stu.hsieh@mediatek.com>
References: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1533780949-30141-1-git-send-email-stu.hsieh@mediatek.com>
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

VGhpcyBwYXRjaCBhZGQgZnVuY3Rpb24gdG8gcmV0dXJuIE9WTCBsYXllciBudW1iZXIKCkZvciBu
b3csIE1UODE3MywgTVQyNzEyLCBNVDI3MDEgT1ZMIGFsbCBoYXMgNCBsYXllci4KClNpZ25lZC1v
ZmYtYnk6IFN0dSBIc2llaCA8c3R1LmhzaWVoQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQtYnk6IENL
IEh1IDxjay5odUBtZWRpYXRlay5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX292bC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMKaW5kZXggMGZhY2Q4MjNjNTUy
Li4yOGQxOTExOTI5NDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMK
QEAgLTEzMiw2ICsxMzIsMTEgQEAgc3RhdGljIHZvaWQgbXRrX292bF9jb25maWcoc3RydWN0IG10
a19kZHBfY29tcCAqY29tcCwgdW5zaWduZWQgaW50IHcsCiAJd3JpdGVsKDB4MCwgY29tcC0+cmVn
cyArIERJU1BfUkVHX09WTF9SU1QpOwogfQogCitzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxf
bGF5ZXJfbnIoc3RydWN0IG10a19kZHBfY29tcCAqY29tcCkKK3sKKwlyZXR1cm4gNDsKK30KKwog
c3RhdGljIHZvaWQgbXRrX292bF9sYXllcl9vbihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1
bnNpZ25lZCBpbnQgaWR4KQogewogCXVuc2lnbmVkIGludCByZWc7CkBAIC0yMjYsNiArMjMxLDcg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZGRwX2NvbXBfZnVuY3MgbXRrX2Rpc3Bfb3ZsX2Z1
bmNzID0gewogCS5zdG9wID0gbXRrX292bF9zdG9wLAogCS5lbmFibGVfdmJsYW5rID0gbXRrX292
bF9lbmFibGVfdmJsYW5rLAogCS5kaXNhYmxlX3ZibGFuayA9IG10a19vdmxfZGlzYWJsZV92Ymxh
bmssCisJLmxheWVyX25yID0gbXRrX292bF9sYXllcl9uciwKIAkubGF5ZXJfb24gPSBtdGtfb3Zs
X2xheWVyX29uLAogCS5sYXllcl9vZmYgPSBtdGtfb3ZsX2xheWVyX29mZiwKIAkubGF5ZXJfY29u
ZmlnID0gbXRrX292bF9sYXllcl9jb25maWcsCi0tIAoyLjEyLjUuMi5nYmRmMjNhYgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
