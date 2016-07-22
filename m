From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH] GPU-DRM: Delete an unnecessary check before
 drm_property_unreference_blob()
Date: Fri, 22 Jul 2016 12:56:23 +0200
Message-ID: <515bcb7e-3e00-3438-cc47-227cfcd41990@users.sourceforge.net>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <5317A59D.4@users.sourceforge.net>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0PgpEYXRl
OiBGcmksIDIyIEp1bCAyMDE2IDEyOjQ4OjEyICswMjAwCgpUaGUgZHJtX3Byb3BlcnR5X3VucmVm
ZXJlbmNlX2Jsb2IoKSBmdW5jdGlvbiB0ZXN0cyB3aGV0aGVyIGl0cyBhcmd1bWVudAppcyBOVUxM
IGFuZCB0aGVuIHJldHVybnMgaW1tZWRpYXRlbHkuClRodXMgdGhlIHRlc3QgYXJvdW5kIHRoZSBj
YWxsIGlzIG5vdCBuZWVkZWQuCgpUaGlzIGlzc3VlIHdhcyBkZXRlY3RlZCBieSB1c2luZyB0aGUg
Q29jY2luZWxsZSBzb2Z0d2FyZS4KClNpZ25lZC1vZmYtYnk6IE1hcmt1cyBFbGZyaW5nIDxlbGZy
aW5nQHVzZXJzLnNvdXJjZWZvcmdlLm5ldD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9jcnRjLmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKaW5k
ZXggMjRhYTNiYS4uMDc1NDFkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ny
dGMuYwpAQCAtMTEyLDkgKzExMiw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19yZXNldChz
dHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJc3RydWN0IG10a19jcnRjX3N0YXRlICpzdGF0ZTsKIAog
CWlmIChjcnRjLT5zdGF0ZSkgewotCQlpZiAoY3J0Yy0+c3RhdGUtPm1vZGVfYmxvYikKLQkJCWRy
bV9wcm9wZXJ0eV91bnJlZmVyZW5jZV9ibG9iKGNydGMtPnN0YXRlLT5tb2RlX2Jsb2IpOwotCisJ
CWRybV9wcm9wZXJ0eV91bnJlZmVyZW5jZV9ibG9iKGNydGMtPnN0YXRlLT5tb2RlX2Jsb2IpOwog
CQlzdGF0ZSA9IHRvX210a19jcnRjX3N0YXRlKGNydGMtPnN0YXRlKTsKIAkJbWVtc2V0KHN0YXRl
LCAwLCBzaXplb2YoKnN0YXRlKSk7CiAJfSBlbHNlIHsKLS0gCjIuOS4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
