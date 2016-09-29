From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH 2/2] drm/mediatek: clear IRQ status before enable OVL interrupt
Date: Thu, 29 Sep 2016 11:29:49 +0800
Message-ID: <1475119789-64619-3-git-send-email-bibby.hsieh@mediatek.com>
References: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1475119789-64619-1-git-send-email-bibby.hsieh@mediatek.com>
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

VG8gbWFrZSBzdXJlIHRoYXQgdGhlIGZpcnN0IHZibGFuayBJUlEgYWZ0ZXIgZW5hYmxpbmcKdmJs
YW5rIGlzbid0IHRvbyBzaG9ydCBvciBpbW1lZGlhdGUsIHdlIGhhdmUgdG8gY2xlYXIKdGhlIElS
USBzdGF0dXMgYmVmb3JlIGVuYWJsZSBPVkwgaW50ZXJydXB0LgoKU2lnbmVkLW9mZi1ieTogQmli
YnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAgICAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYwppbmRleCAwMTli
N2NhLi5mNzVjNWI1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rp
c3Bfb3ZsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCkBA
IC04MCw2ICs4MCw3IEBAIHN0YXRpYyB2b2lkIG10a19vdmxfZW5hYmxlX3ZibGFuayhzdHJ1Y3Qg
bXRrX2RkcF9jb21wICpjb21wLAogCQkJCQkJIGRkcF9jb21wKTsKIAogCXByaXYtPmNydGMgPSBj
cnRjOworCXdyaXRlbCgweDAsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxfSU5UU1RBKTsKIAl3
cml0ZWxfcmVsYXhlZChPVkxfRk1FX0NQTF9JTlQsIGNvbXAtPnJlZ3MgKyBESVNQX1JFR19PVkxf
SU5URU4pOwogfQogCi0tIAoxLjcuOS41CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
