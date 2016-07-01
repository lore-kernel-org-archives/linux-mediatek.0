From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] drm/mediatek/mtk_mipi_tx: checking the wrong variable
Date: Fri, 1 Jul 2016 16:59:34 +0300
Message-ID: <20160701135934.GA15723@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, CK Hu <ck.hu@mediatek.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

V2Ugc2hvdWxkIGJlIGNoZWNraW5nICJwaHlfcHJvdmlkZXIiIGhlcmUgbm90ICJwaHkiLgoKRml4
ZXM6IDJlNTRjMTRlMzEwZiAoJ2RybS9tZWRpYXRlazogQWRkIERTSSBzdWIgZHJpdmVyJykKU2ln
bmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbWlwaV90eC5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMKaW5kZXggY2Y4ZjM4ZC4uMWMzNjZmOCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19taXBpX3R4LmMKQEAgLTQzMSw3ICs0MzEsNyBA
QCBzdGF0aWMgaW50IG10a19taXBpX3R4X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJcGh5X3NldF9kcnZkYXRhKHBoeSwgbWlwaV90eCk7CiAKIAlwaHlfcHJvdmlkZXIgPSBk
ZXZtX29mX3BoeV9wcm92aWRlcl9yZWdpc3RlcihkZXYsIG9mX3BoeV9zaW1wbGVfeGxhdGUpOwot
CWlmIChJU19FUlIocGh5KSkgeworCWlmIChJU19FUlIocGh5X3Byb3ZpZGVyKSkgewogCQlyZXQg
PSBQVFJfRVJSKHBoeV9wcm92aWRlcik7CiAJCXJldHVybiByZXQ7CiAJfQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
