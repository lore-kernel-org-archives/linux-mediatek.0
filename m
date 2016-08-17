From: Bibby Hsieh <bibby.hsieh@mediatek.com>
Subject: [PATCH v4 3/3] drm/mediatek: fix the wrong pixel clock when
 resolution is 4K
Date: Wed, 17 Aug 2016 14:58:08 +0800
Message-ID: <1471417088-2993-4-git-send-email-bibby.hsieh@mediatek.com>
References: <1471417088-2993-1-git-send-email-bibby.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1471417088-2993-1-git-send-email-bibby.hsieh@mediatek.com>
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
Cc: Junzhi Zhao <junzhi.zhao@mediatek.com>, linux-kernel@vger.kernel.org, Cawa Cheng <cawa.cheng@mediatek.com>, Mao Huang <littlecvr@chromium.org>, Yingjoe Chen <yingjoe.chen@mediatek.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

RnJvbTogSnVuemhpIFpoYW8gPGp1bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KClBpeGVsIGNsb2Nr
IHNob3VsZCBiZSAyOTdNSHogd2hlbiByZXNvbHV0aW9uIGlzIDRLLgoKU2lnbmVkLW9mZi1ieTog
SnVuemhpIFpoYW8gPGp1bnpoaS56aGFvQG1lZGlhdGVrLmNvbT4KU2lnbmVkLW9mZi1ieTogQmli
YnkgSHNpZWggPGJpYmJ5LmhzaWVoQG1lZGlhdGVrLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jIHwgICAgOSArKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcGkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMK
aW5kZXggMDE4NmU1MC4uOTBmYjgzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCkBA
IC00MzIsMTEgKzQzMiwxNiBAQCBzdGF0aWMgaW50IG10a19kcGlfc2V0X2Rpc3BsYXlfbW9kZShz
dHJ1Y3QgbXRrX2RwaSAqZHBpLAogCXVuc2lnbmVkIGxvbmcgcGxsX3JhdGU7CiAJdW5zaWduZWQg
aW50IGZhY3RvcjsKIAorCS8qIGxldCBwbGxfcmF0ZSBjYW4gZml4IHRoZSB2YWxpZCByYW5nZSBv
ZiB0dmRwbGwgKDFHfjJHSHopICovCiAJcGl4X3JhdGUgPSAxMDAwVUwgKiBtb2RlLT5jbG9jazsK
LQlpZiAobW9kZS0+Y2xvY2sgPD0gNzQwMDApCisJaWYgKG1vZGUtPmNsb2NrIDw9IDI3MDAwKQor
CQlmYWN0b3IgPSAxNiAqIDM7CisJZWxzZSBpZiAobW9kZS0+Y2xvY2sgPD0gODQwMDApCiAJCWZh
Y3RvciA9IDggKiAzOwotCWVsc2UKKwllbHNlIGlmIChtb2RlLT5jbG9jayA8PSAxNjcwMDApCiAJ
CWZhY3RvciA9IDQgKiAzOworCWVsc2UKKwkJZmFjdG9yID0gMiAqIDM7CiAJcGxsX3JhdGUgPSBw
aXhfcmF0ZSAqIGZhY3RvcjsKIAogCWRldl9kYmcoZHBpLT5kZXYsICJXYW50IFBMTCAlbHUgSHos
IHBpeGVsIGNsb2NrICVsdSBIelxuIiwKLS0gCjEuNy45LjUKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
